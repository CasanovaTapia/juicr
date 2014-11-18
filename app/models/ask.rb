class Ask < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :offers, dependent: :destroy

  validates :project_name, presence: true, length: { minimum: 5 }
  validates :project_description, :skills, :time_commitment, :location, :expectations, presence: true

  default_scope { order('created_at DESC') }

  searchkick

  def has_accepted_offer?
    self.offers.where(accepted: true).exists? == true
  end

end
