class Event < ApplicationRecord
  belongs_to :prefecture, optional: true
  belongs_to :position, optional: true
  belongs_to :event_status, optional: true
  has_many :applicants, through: :users
  has_one :user


  validates :name, presence: true
  validates :start_day, presence: true
  validates :prefecture_id, presence: true
  validates :position_id, presence: true
  validates :assign_num, presence: true
end
