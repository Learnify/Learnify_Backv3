class Subject < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :summary, presence: true
    belongs_to :user
end
