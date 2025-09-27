class SessionsController < ApplicationController
  def omniauth
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      session[:user_id] = user.id
      redirect_to root_path, notice: "Successfully signed in with GitHub!"
    else
      redirect_to root_path, alert: "There was an error signing you in."
    end
  end

  def failure
    redirect_to root_path, alert: "Authentication failed: #{params[:message]}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been signed out."
  end
end
