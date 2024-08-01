class UsersController < ApplicationController
  before_action :set_user, only: [:show]

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

  private

  def set_user
    @user = User.find(params[:id])
  end
end
