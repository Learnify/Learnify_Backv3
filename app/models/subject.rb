class Subject < ApplicationRecord
    validates :name, presence: true
    validates :summary, presence: true
    has_and_belongs_to_many :users
end
