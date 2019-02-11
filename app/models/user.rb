class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true

    belongs_to :role
    belongs_to :career
    has_many :article
end
