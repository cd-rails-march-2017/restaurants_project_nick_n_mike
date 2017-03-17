class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # LOGIN ROUTE
  def login
  end

  def login_create
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])

    if !@user
      flash[:errors] =  ["Invalid Login"]
      redirect_to users_login_path
    else
      flash[:notice] = ["You are logged in"]
      session[:user] = {id: @user.id, email: @user.email}
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = ['You are logged in']
      session[:user] = {id: @user.id, email: @user.email}
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def destroy
    session.clear
    redirect_to users_login_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
