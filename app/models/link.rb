class Link < ApplicationRecord
  belongs_to :domain
  has_many :link_users, dependent: :destroy
end