class Event < ApplicationRecord
  has_many :tickets
  has_many :comments
  belongs_to :user
  belongs_to :category
  mount_uploader :image, ImageUploader
  paginates_per 15

  geocoded_by :address               # can also be an IP address
  after_validation :geocode, if: :address_changed?          # auto-fetch coordinates
end
