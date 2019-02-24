class Article < ApplicationRecord
    belongs_to :user
    before_create :set_count
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true

    def update_visits
       self.update(visits_count: (self.visits_count.to_i + 1).to_s) 
    end
    
    private 
    def set_count
        self.visits_count = "0"
    end
end
