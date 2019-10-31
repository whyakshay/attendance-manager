class ClockEventValidator < ActiveModel::Validator
  def validate(record)
    # Add error to the record if the event type for user is not allowed
    unless record.user.allowed_event?(record.event_type)
      record.errors.add(:event_type, 'is not allowed')
    end
  end
end
