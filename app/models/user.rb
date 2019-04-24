class User < ApplicationRecord
    validates :password, confirmation: true
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true


    has_secure_password

    has_many :
    has_many :
    has_many :

    def self.find_or_create_by_omniauth(auth_hash)
        where(email: auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
            user.name = auth_hash["info"]["name"]
        end
    end

  
end
