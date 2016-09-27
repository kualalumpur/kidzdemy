class Category < ApplicationRecord
  has_many :events
  mount_uploader :image, ImageUploader
end
