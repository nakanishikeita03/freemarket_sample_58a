class AddColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :fee_payer, :integer, null: false
    add_column :products, :delivery_time, :integer, null: false
  end
end
