class Tutorial < ApplicationRecord
    validates :appointment, presence: true
    belongs_to :professor, :class_name => 'User', :foreign_key => 'professor_id'
    belongs_to :student, :class_name => 'User', :foreign_key => 'user_id_id'
    belongs_to :subject
end
