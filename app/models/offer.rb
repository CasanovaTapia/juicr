class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :ask

  validates :body, presence: true

  after_create :send_offer_emails

  def any_accepted?
    self.class.where(accepted: true, ask: self.ask).exists? == false
  end

  private

  def send_offer_emails
    OfferMailer.new_offer(self.user, self.ask, self).deliver
  end
end
