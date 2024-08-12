class TestPolicy < ApplicationPolicy

  def edit?
    admin_or_same_user?
  end

  def update?
    admin_or_same_user?
  end

  def destroy?
    admin_or_same_user?
  end
end
