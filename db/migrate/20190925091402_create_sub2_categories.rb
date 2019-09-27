class CreateSub2Categories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub2_categories do |t|
      t.string             :name, null: false
      t.references         :sub_category,null: false,foreign_key: true
      t.timestamps
    end
  end
end
