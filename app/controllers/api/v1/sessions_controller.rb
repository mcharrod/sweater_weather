class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user.present? && password_authenticated?(@user, params[:password], params[:password_confirmation])
      render json: Api::V1::UsersSerializer.hashed(@user)
    else
      render json: MessageSerializer.hashed_login_error
    end
  end

  private

    def password_authenticated?(user, password, password_confirmation)
      user.authenticate(password) && user.authenticate(password_confirmation)
    end
end
