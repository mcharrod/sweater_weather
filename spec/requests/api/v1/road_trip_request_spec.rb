require 'rails_helper'

describe 'road trip API endpoint' do
  it 'returns expected hashed response' do
    VCR.use_cassette("road_trip request") do
      user1 = User.create!(email: "yolo@yolo.com", password: "password13")

      post api_v1_road_trip_path(origin: "Denver,CO", destination: "Estes Park, CO", api_key: user1.assign_api_key)
      parsed_response = JSON.parse(response.body, symbolize_names: true)


      json_response = File.read('spec/fixtures/vcr_cassettes/road_trip.json')

    #
    # expected_response = {
    #   "data": {
    #     "id": nil,
    #     "type": "roadtrip",
    #     "attributes": {
    #       "start_city": "Denver, CO",
    #       "end_city": "Estes Park, CO",
    #       "travel_time": "01:22:19",
    #       "weather_at_eta": {
    #         "temperature": 59.4,
    #         "conditions": "partly cloudy with a chance of meatballs"
    #       }
    #     }
    #   }
    # }


      expect(parsed_response).to eq(json_response)
    end
  end
end
