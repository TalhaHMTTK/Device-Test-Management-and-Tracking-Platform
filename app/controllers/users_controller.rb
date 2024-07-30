class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def impersonate
    ActsAsTenant.without_tenant do
      user = User.find(params[:id])
      impersonate_user(user)
      redirect_to root_path
    end
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to super_admin_all_users_path
  end

  def show; end

  def edit; end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :role, :address, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
