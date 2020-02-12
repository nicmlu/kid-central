class Event < ActiveRecord::Base
    belongs_to :kid
    validates :name, :date, :time, :location, :rsvp, :gift, presence: true

  end