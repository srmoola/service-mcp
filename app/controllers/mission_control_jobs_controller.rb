class MissionControlJobsController < ApplicationController
  # Option 1: Disable authentication for development (NOT recommended for production)
  # Remove this method and uncomment Option 2 or 3 for production
  
  # Option 2: HTTP Basic Authentication with username/password
  # Uncomment and customize for production:
  # 
  # private
  # 
  # def authenticate_by_http_basic
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == "admin" && password == "your_secure_password"
  #   end
  # end
  
  # Option 3: Use your existing authentication system
  # Uncomment and customize for production:
  #
  # before_action :authenticate_user!  # or whatever your auth method is
  # 
  # private
  # 
  # def authenticate_by_http_basic
  #   # Skip HTTP basic auth if user is already authenticated
  #   current_user.present?
  # end
end
