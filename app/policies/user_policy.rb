class UserPolicy < ApplicationPolicy

  def create?
    invite?
  end

  def invite?
    user.admin?
  end

  def edit?
    user.admin? || record.id == user.id
  end

  def active_admin_access?
    user.super_admin?
  end
end
