class Link < ApplicationRecord
  # Relationship
  belongs_to :domain
  has_many :link_users, dependent: :destroy

  # Validations
  validates :url, presence: true, uniqueness: { case_sensitive: false }
  validates :domain, presence: true
end