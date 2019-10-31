class ClockEvent < ApplicationRecord
  #include ActiveModel::Validations
  audited

  enum event_type: ClockEventType::EVENT_TYPES
  belongs_to :user

  scope :persisted, -> { reject { |clock_event| clock_event.new_record? } }

  validates_with ClockEventValidator

  validates :time, presence: true
  validates :event_type, presence: true

  scope :today, -> { where("created_at > ?", Time.zone.now.beginning_of_day) }
end
