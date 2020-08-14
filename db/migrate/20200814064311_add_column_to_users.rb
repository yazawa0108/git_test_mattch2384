class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :profile_image, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :integer
    add_column :users, :achievement, :text
    add_column :users, :betray_flg, :integer
  end
end
