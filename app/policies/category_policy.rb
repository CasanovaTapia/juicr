class CategoryPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    create?
  end

  def create?
    user.present? && user.role == "admin"
  end

  def destroy?
    create?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
