class Event < ApplicationRecord
  belongs_to :prefecture
  belongs_to :position
  # belongs_to :event_status
end
