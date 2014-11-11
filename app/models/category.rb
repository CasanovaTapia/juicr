class Category < ActiveRecord::Base
  has_many :asks
end
