class Event < ActiveRecord::Base
    belongs_to :kid
    has_one :user through: :kid
    validates :name, :date, :time, :location, :rsvp, :gift, presence: true
  end