class ChangeDataWorkStartTimeToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :work_start_time, :time
    change_column :events, :work_end_time, :time
  end
end
