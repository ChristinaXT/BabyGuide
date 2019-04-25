class Request < ApplicationRecord
  validates :item, presence: true

  has_many :users_request
  has_many :users, through: :users_request
  belongs_to :checklist

  def status
    finished? "Finished" : "Unfinished"
  end

  def user_closed?(user)
    users_request.find{|user_request|user_request.user_id == user.id}.closed
  end

  def open_users
    users.select do |user|
    user_closed?(user) == false
    end
  end

  def finished_request
    finished ? "Finished" : "Update Status"
  end
end 
