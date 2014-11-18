class Category < ActiveRecord::Base
  has_many :asks
  has_many :users
end
