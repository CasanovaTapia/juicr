class User < ActiveRecord::Base
  has_many :asks, dependent: :destroy
  has_many :offers, dependent: :destroy
  belongs_to :category

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.avatar = auth.info.image
    end
  end

  def name
    self.first_name + " " + self.last_name
  end

  def avatar_small
    self.avatar.split("=")[0] << "?size=50x50"
  end

  def avatar_large
    self.avatar.split("=")[0] << "?=large"
  end

  def accepted_offers
    self.offers.where(accepted: true)
  end

  def pending_offers
    self.offers.where(accepted: false)
  end
end
