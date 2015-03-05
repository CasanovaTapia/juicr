class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def create?
        user.present? && (record.offer.user == user || record.offer.ask.user == user)
    end
  end
end
