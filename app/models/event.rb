class Event < ApplicationRecord
  belongs_to :prefecture
  belongs_to :position
  belongs_to :event_status

  validates :name, presence: true
  validates :start_day, presence: true
  validates :prefecture_id, presence: true
  validates :position_id, presence: true
  validates :assign_num, presence: true
end
