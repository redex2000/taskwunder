class UsersController < ApplicationController
  before_action :auth_and_set_user, only: [:show, :update, :edit, :destroy]

  def index
    authorize User
    @users = User.normal
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to users_path, notice: 'User created successfully!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to users_path, notice: 'User updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User deleted successfully!'
  end

  private
  def auth_and_set_user
    @user = User.find params[:id]
    authorize @user
  end

  def user_params
    params.require(:user).permit(:bio, :birth_date, :full_name, :email, :password, :password_confirmation, :avatar)
  end
end
