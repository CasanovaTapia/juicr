class Ask < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :gives, dependent: :destroy

  default_scope { order('created_at DESC') }

  searchkick
end
