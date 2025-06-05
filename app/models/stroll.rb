class Stroll < ApplicationRecord
  belongs_to :dog
  belongs_to :dog_sitter
  validates :dog, uniqueness: { scope: :dog_sitter, message: "has already this dog_sitter" }
end
