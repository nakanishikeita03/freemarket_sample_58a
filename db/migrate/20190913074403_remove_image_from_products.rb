class RemoveImageFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :image, :references, foreign_key:true
  end
end
