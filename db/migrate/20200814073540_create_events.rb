class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.references :owner, foreign_key: { to_table: :users }
      t.date :start_day
      t.date :end_day
      t.date :work_start_time
      t.date :work_end_time
      t.references :prefecture, foreign_key: true
      t.string :address
      t.integer :daily_wage
      t.text :detail
      t.references :event_status, foreign_key: true
      t.references :position, foreign_key: true
      t.integer :assign_num, null: false
      t.string :place_name
      t.timestamps
    end
  end
end
