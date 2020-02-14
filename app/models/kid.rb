class Kid < ActiveRecord::Base
    belongs_to :user
    has_many :events
    validates :name, :gender, :birthdate, presence: true
end