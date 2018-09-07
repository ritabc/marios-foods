class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :cost, :country_of_origin, presence: true
  validates :name, uniqueness: true
end
