class Career < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :user
end
