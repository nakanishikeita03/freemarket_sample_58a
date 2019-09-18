class Image < ApplicationRecord
  belongs_to :product,dependent: :destroy
  mount_uploader :image, ImageUploader
end
