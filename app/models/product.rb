class Product < ApplicationRecord
  belongs_to :user
  has_many   :images,dependent: :destroy
  accepts_nested_attributes_for :images

  validates :name, presence: true
  validates :detail, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :delivery, presence: true
end
