class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true

    belongs_to :role
    belongs_to :career
    has_many :article
    
    def name 
        email.split('@')[0].upcase    
    end
    
    def admin
       return verificar 
    end
    
    private
        def verificar
            if name == "admin"
                return true
            else
                return false
            end
        end
end
