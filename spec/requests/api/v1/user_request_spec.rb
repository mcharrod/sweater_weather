require 'rails_helper'

describe 'user registration' do
  before do
    body = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }

    headers = {
      "CONTENT_TYPE": "application/json"
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(body)

    @response = JSON.parse(response.body, symbolize_names: true)
  end

  it 'returns json of the user' do

    expected_response = {
      "data": {
        "type": "users",
        "id": @response[:data][:id],
        "attributes": {
          "email": "whatever@example.com",
          "api_key": "#{@response[:data][:attributes][:api_key]}"
        }
      }
    }

    expect(@response).to eq(expected_response)
  end


  it "user login" do
    user = User.create!(email: "test@email.com", password: "12345", password_confirmation: "12345")

    session_params = {
           "email": "test@email.com",
           "password": "12345",
           "password_confirmation": "12345"
        }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(session_params)

    user_result = JSON.parse(response.body, symbolize_names: true)

    expected_response =
        {
          "data": {
            "type": "users",
            "id": user.id,
            "attributes": {
              "email": user.email,
              "api_key": user.api_key
            }
          }
        }

    expect(user_result).to eq(expected_response)
    expect(response).to have_http_status(200)
		expect(user.email).to eq(session_params[:email])
  end
end
