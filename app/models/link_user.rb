class LinkUser < ApplicationRecord
  # Relationship
  belongs_to :user
  belongs_to :link

  # Validations
  validates :user, :link, presence: true
  validates :link_id, uniqueness: { scoped: :user }
end