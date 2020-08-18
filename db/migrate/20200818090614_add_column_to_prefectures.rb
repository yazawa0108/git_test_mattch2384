class AddColumnToPrefectures < ActiveRecord::Migration[6.0]
  def change
    rename_column :prefectures, :name, :prefecture_name
    add_column :prefectures, :prefecture_kana, :string
  end
end
