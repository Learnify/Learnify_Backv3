class Article < ApplicationRecord
    belongs_to :user
    before_create :set_count
    
    def update_visits
       self.update(visualizations: (self.visualizations.to_i + 1).to_s) 
    end
    
    private 
    def set_count
        self.visualizations = "0"
    end
end
