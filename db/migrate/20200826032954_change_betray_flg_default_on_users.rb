class ChangeBetrayFlgDefaultOnUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :betray_flg, from: nil, to: 0
  end
end
