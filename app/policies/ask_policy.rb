class AskPolicy < ApplicationPolicy
  def index?
    true
  end

  def create_offer?
    record.user != user
  end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
