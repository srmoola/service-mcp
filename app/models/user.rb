class User < ApplicationRecord
  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_initialize
    
    # Update user attributes (including token) on each login
    user.assign_attributes(
      provider: auth.provider,
      uid: auth.uid,
      name: auth.info.name,
      email: auth.info.email,
      avatar_url: auth.info.image,
      github_token: auth.credentials.token
    )
    
    user.save!
    user
  end
end
