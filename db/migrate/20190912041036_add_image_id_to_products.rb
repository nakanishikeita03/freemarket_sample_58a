class AddImageIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :image, :integer, null: false
  end
end
