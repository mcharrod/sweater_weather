require 'rails_helper'

describe 'road trip API endpoint' do
  it 'possible route returns info' do
    VCR.use_cassette("road_trip request") do
      user1 = User.create!(email: "yolo@yolo.com", password: "password13")

      post api_v1_road_trip_path(origin: "Denver,CO", destination: "Estes Park, CO", api_key: user1.assign_api_key)
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expected_response = {
          "data": {
              "id": nil,
              "type": "roadtrip",
              "attributes": {
                  "start_city": "Denver,CO",
                  "end_city": "Estes Park, CO",
                  "travel_time": "01:22:19",
                  "weather_at_eta": {
                      "temperature": 49.89,
                      "conditions": "clear sky"
                  }
              }
          }
      }

      expect(parsed_response).to eq(expected_response)
    end
  end

  it 'does not create a roadtrip if route is impossible' do
    VCR.use_cassette("impossible road_trip") do
      user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")

      headers = { "Content-Type" => "application/json", "Accept" => "application/json" }
      body = {
        "origin": "New York, NY",
        "destination": "London, UK",
        "api_key": user.assign_api_key
      }

      post '/api/v1/road_trip', :params => body.to_json , :headers => headers

      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed).to eq({:message=>"trip is impossible"})
    end
  end
end
