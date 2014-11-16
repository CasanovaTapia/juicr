class OfferPolicy < ApplicationPolicy
  def update?
    record.ask.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
