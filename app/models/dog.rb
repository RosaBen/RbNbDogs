class Dog < ApplicationRecord
  has_many :strolls
  has_many :dog_sitters, through: :strolls
  belongs_to :city
  validates :name, uniqueness: true
end
