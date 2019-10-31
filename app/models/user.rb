class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :clock_events

  def allowed_events
    allowed_events = []

    last_event = clock_events.persisted.last

    if last_event.blank? || last_event.event_type.eql?(ClockEventType::CLOCK_OUT)
      allowed_events << ClockEventType::CLOCK_IN
    elsif last_event.event_type.eql?(ClockEventType::CLOCK_IN)
      allowed_events << ClockEventType::CLOCK_OUT
    end
    allowed_events
  end


  def allowed_event?(event)
    allowed_events.include?(event)
  end
end
