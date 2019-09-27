class CreateSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_categories do |t|
      t.string             :name, null: false
      t.references         :main_category,null: false,foreign_key: true
      t.timestamps
    end
  end
end
