class Checklist < ApplicationRecord
    validates :item, presence: true

    has_many :requests
    belongs_to :user

    def checklist_closed?
        !requests.any?{|request| request.status == "Open"}
    end 
end
