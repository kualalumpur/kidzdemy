class Event < ApplicationRecord
  has_many :tickets
  has_many :comments
  belongs_to :user
  belongs_to :category
  mount_uploader :image, ImageUploader
  enum etype: [:free, :paid]
end
