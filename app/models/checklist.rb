class Checklist < ApplicationRecord
    validates :item, presence: true

    has_many :requests
    belongs_to :user

    def checklist_finished?
        !requests.any?{|request| request.status == "Unfinished"}
    end
end
