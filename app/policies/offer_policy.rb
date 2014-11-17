class OfferPolicy < ApplicationPolicy
  def update?
    record.ask.user == user && (record.any_accepted?)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
