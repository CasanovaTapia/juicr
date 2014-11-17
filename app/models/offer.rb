class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :ask

  def any_accepted?
    self.class.where(accepted: true, ask: self.ask).exists? == false
  end
end
