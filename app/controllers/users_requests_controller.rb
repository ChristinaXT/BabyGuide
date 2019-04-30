class UsersRequestsController < ApplicationController

  def update
    @user_request = UsersRequests.find_by(id: params[:id])
      if @user_request.update(users_request_params)
         redirect_to user_path(@user_request.user_id)
    else
         redirect_to user_path(@user_request.user_id)
      end
  end

  private

  def users_request_params
     params.require(:users_request).permit(:closed, :user_id, :request_id)
  end
end
