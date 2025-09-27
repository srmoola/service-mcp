class HomeController < ApplicationController
  def index
    # This action will render the index view template
  end

  def select_repositories
    @current_user = User.find(session[:user_id]) if session[:user_id]
    
    if @current_user&.github_token
      client = Octokit::Client.new(access_token: @current_user.github_token)
      begin
        @repositories = client.repositories
      rescue Octokit::Unauthorized => e
        flash[:alert] = "Your GitHub token has expired. Please sign in again."
        session[:user_id] = nil  # Clear the session
        redirect_to root_path
        return
      rescue Octokit::Error => e
        flash[:alert] = "Error fetching repositories: #{e.message}"
        @repositories = []
      end
    else
      flash[:alert] = "Please sign in with GitHub to view repositories"
      redirect_to root_path
    end
  end
end
