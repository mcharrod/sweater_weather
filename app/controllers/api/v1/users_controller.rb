class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if params[:password] != params[:password_confirmation]
      render json: { error: "passwords do not match"}, status: :bad_request
    elsif params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
      render json: { error: "missing a field"}, status: :bad_request
    elsif User.find_by(email: params[:email])
      render json: { error: "email already exists"}, status: :bad_request
    else
      user.assign_api_key
      user.save
      render json: Api::V1::UsersSerializer.hashed(user), status: 201
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end





# puts "bingus"


# generate a user model

# attirbutes email

# password digest

# api_key?????

# 0. check that the body is coming in as JSON

# 1. check that the password matches the password confirmation

# 1a. generate API key (user.api_key = SecureRandom.hex(10))

# 2. if steps 0-1 pass, save the user ( user.save )

# elsif, we will render an error bad credential error

# render json: Serializer.get_list_of things, status: 400

# 3. if no errors, render user serializer with expected_response
