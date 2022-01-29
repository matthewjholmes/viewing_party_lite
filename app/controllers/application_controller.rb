class ApplicationController < ActionController::Base

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def handle_restrictions
    unless current_user
      flash[:alert] = "You must be logged in to view this page."
      redirect_to root_path
    end
  end
end
