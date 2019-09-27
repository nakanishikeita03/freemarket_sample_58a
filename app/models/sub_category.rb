class SubCategory < ApplicationRecord
  belongs_to :main_category
  has_many   :sub2_categories
end
