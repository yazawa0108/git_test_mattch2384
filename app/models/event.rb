class Event < ApplicationRecord
  belongs_to :prefecture, optional: true
  belongs_to :position, optional: true
  belongs_to :event_status, optional: true
  has_many :users, through: :applicants
  has_many :applicants


  validates :name, presence: true
  validates :start_day, presence: true
  validate :end_day, :check_end
  validates :prefecture_id, presence: true
  validates :position_id, presence: true
  validates :assign_num, presence: true

  private

  def check_end
    if end_day.present? && start_day > end_day
      errors.add(:end_day, "を開始日以降に設定してください。")
    end
  end
end
