class SessionsController < ApplicationController
  def login
    # binding.pry
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      # byebug
      user = User.find_by(username: params[:username])
      token = encode_token(user.id)
      render json: {user: UserSerializer.new(user), token: token}
    else
      render json: {errors: "LOGIN FAILED!!! PLEASE TRY AGAIN!"}
    end
  end

  def autoLogin

    if !!current_app_user
      render json: {user: UserSerializer.new(current_app_user)}
    else
      render json: {errors: "Authentication Failed"}
    end
  end
end
