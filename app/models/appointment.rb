class Appointment < ApplicationRecord
    validates :appointment, presence: true
    has_and_belongs_to_many :users
end
