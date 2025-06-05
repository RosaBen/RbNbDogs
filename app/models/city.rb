class City < ApplicationRecord
  has_many :dogs
  has_many :dog_sitters
  validates :city_name, uniqueness: true
end
