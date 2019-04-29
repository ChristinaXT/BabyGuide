class UsersRequest < ApplicationRecord
  belongs_to :user
  belongs_to :request

  def self.open_by_user(user)
    Users.Request.where(closed: false).select{|users_request| users_request.user_id == user.id}
  end
end
