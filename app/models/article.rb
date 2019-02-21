class Article < ApplicationRecord
    belongs_to :user
    before_create :set_count
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true
    def update_visits
       self.update(visualizations: (self.visualizations.to_i + 1).to_s) 
    end
    
    private 
    def set_count
        self.visualizations = "0"
    end
end
