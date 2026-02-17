class TaskPolicy < ApplicationPolicy
  def index?
    true
  end

  def show
    user.admin? || record_user == user
  end

  def create?
    true
  end

  def update?
    user.admin? ||  record_user == user
  end

  def destroy?
    user.admin? || record.user
  end

  # define quais task usuario pode ver
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
end
