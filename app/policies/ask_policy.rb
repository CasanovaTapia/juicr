class AskPolicy < ApplicationPolicy
  def index?
    true
  end

  def create_offer?
    record.user != user && record.offers.where(user_id: user.id).exists? == false
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
