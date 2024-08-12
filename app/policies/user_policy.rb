class UserPolicy < ApplicationPolicy

  def create?
    invite?
  end

  def invite?
    user.admin?
  end

  def edit?
    admin_or_same_user?
  end

  def active_admin_access?
    user.super_admin?
  end
end
