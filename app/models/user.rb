class User < ApplicationRecord
    validates :password, confirmation: true
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true


    has_secure_password

    has_many :checklists
    has_many :users_request
    has_many :requests, through: :users_request

    def self.find_or_create_by_omniauth(auth_hash)
        where(email: auth_hash["info"]["email"]).first_or_create do |user|
          user.password = SecureRandom.hex
          user.name = auth_hash["info"]["name"]
        end
    end

    def open_users_requests
      UsersRequest.open_by_user(self)
    end

    def checklist_requests(user_checklist)
       if checklists.include?(user_checklist)
         user_checklist.requests
      else
           []
       end
    end 
end
