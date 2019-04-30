class UsersRequest < ApplicationRecord
  belongs_to :user
  belongs_to :request

  def self.untaken_by_user(user)
    Users.Request.where(taken: false).select{|users_request| users_request.user_id == user.id}
  end
end
