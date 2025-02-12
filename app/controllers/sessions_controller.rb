class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        flash[:alert] = 'Invalid password'
        redirect_to '/login'
      end
    else
      flash[:alert] = 'Invalid email'
      redirect_to '/login'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
  # private
  #
  # def user_params
  #   # params.require(:user).permit(:name, :email, :password, :password_confirmation)
  #   params.permit(:name, :email, :password, :password_confirmation)
  # end
end
