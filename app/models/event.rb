class Event < ApplicationRecord
  belongs_to :prefecture
  belongs_to :event_status
  belongs_to :position
end
