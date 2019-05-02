class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
    if current_user
      redirect_to '/'
    else
      @user = User.new
    end
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session_login(user)

    elsif @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
         session_login(@user)
      else
        flash[:message] = "Password Incorrect"
        render controller: 'users', action: 'new'
      end
    end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
