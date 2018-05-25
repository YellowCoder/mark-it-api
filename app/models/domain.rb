class Domain < ApplicationRecord
  # Relationship
  has_many :links

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end