class Link < ApplicationRecord
  has_many :link_users, dependent: :destroy
end