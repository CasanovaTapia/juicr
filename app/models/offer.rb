class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :ask

  def accept
    self.update(accepted: true)
  end
end
