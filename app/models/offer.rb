class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :ask

  validates :body, presence: true, length: { minimum: 140 }

  def any_accepted?
    self.class.where(accepted: true, ask: self.ask).exists? == false
  end
end
