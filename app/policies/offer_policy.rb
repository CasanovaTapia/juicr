class OfferPolicy < ApplicationPolicy
  def update?
    record.ask.user == user && (record.any_accepted?)
  end

  def project?
    record.accepted == true && (record.user == user || record.ask.user == user)
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
