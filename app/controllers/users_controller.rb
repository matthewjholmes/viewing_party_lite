class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # user = User.new(user_params)
    # if user.save
    #   flash[:notice] = "Welcome #{user.name}"
    #   redirect_to dashboard_path(user)
    # else
    #   flash[:alert] = "Could not create user. Please try again."
    #   redirect_to register_path
    # end
    user = User.create!(user_params)
    redirect_to user_path(user)
  end

  def show
    @user = User.find(params[:user_id])
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])

    if user
      if user.authenticate(params[:password])
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
