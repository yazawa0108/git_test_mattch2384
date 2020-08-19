class ChangeColumnDefaultToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column_default :events, :event_status_id, 1
  end
end
