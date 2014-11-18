class UserPolicy < ApplicationPolicy
  def update?
    record.id == user.id
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
