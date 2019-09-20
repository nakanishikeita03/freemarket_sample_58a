class AddColumnToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :f_name_kanji, :string, null: false, default: '', limit: 15
    add_column :addresses, :l_name_kanji, :string, null: false, default: '', limit: 15
    add_column :addresses, :f_name_kana, :string, null: false, default: '', limit: 15
    add_column :addresses, :l_name_kana, :string, null: false, default: '', limit: 15
  end
end
