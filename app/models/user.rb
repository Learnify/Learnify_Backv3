class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true

    belongs_to :role
    belongs_to :career
    has_many :articles
    has_and_belongs_to_many :subjects
    has_and_belongs_to_many :appointments
    has_many :chat_rooms, dependent: :destroy
    has_many :messages, dependent: :destroy
    
    def nombre 
        email.split('@')[0].upcase    
    end
    
    def admin
       return verificar 
    end
    
    def generate_password_token!
      self.reset_password_token = generate_token
      self.reset_password_sent_at = Time.now.utc
      save!
    end

    def password_token_valid?
      (self.reset_password_sent_at + 4.hours) > Time.now.utc
    end

    def reset_password!(password)
      self.reset_password_token = nil
      self.password = password
      save!
    end
    
    private
        def verificar
            if nombre == "admin"
                return true
            else
                return false
            end
        end
        
        def generate_token
          SecureRandom.hex(10)
        end
end
