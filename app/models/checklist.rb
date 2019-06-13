class Checklist < ApplicationRecord
    validates :item, presence: true

    has_many :requests
    belongs_to :user

    def checklist_finished?
        !requests.any?{|request| request.status == "Unfinished"}
    end

    accepts_nested_attributes_for :requests

    scope :users_with_most_requests, -> { order(name: :desc)}
    scope :requests_untaken, -> { order("")}

    #def self.users_with_most_requests
      #select{ |checklist| checklist.requests.size > all }
      #order(name: :desc)
  #end

    #def self.requests_untaken
      #order("")
  #  end
end
