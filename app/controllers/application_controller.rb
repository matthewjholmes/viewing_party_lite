class ApplicationController < ActionController::Base
  def handle_restrictions
    flash[:alert] = "You must be logged in to view this page."
    redirect_to root_path
  end
end
