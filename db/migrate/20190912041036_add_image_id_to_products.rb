class AddImageIdToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :product, :image, :references, foreign_key:true
  end
end
