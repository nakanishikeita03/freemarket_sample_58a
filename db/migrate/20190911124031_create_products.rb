class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references       :user,  null: false,foreign_key:true
      t.string           :name,     null: false
      t.text             :detail,   null: false
      t.integer          :category, null: false
      t.integer          :price,    null: false
      t.integer          :status,   null: false,default: 0
      t.integer          :state,    null: false,default: 0
      t.integer          :city,     null: false
      t.integer          :delivery, null: false
      t.timestamps
    end
  end
end
