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
    # user = User.create!(user_params)
    # redirect_to user_path(user)
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path(user)
      flash[:notice] = "Welcome #{user.name}"
    else


  end

  def show
    if session[:user_id]
      @user = UserFacade.new(User.find(params[:user_id]))
    else
      handle_restrictions
    end
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
    # params.require(:user).permit(:name, :email, :password, :password_confirmation)
    params.permit(:name, :email, :password, :password_confirmation)
  end

end
