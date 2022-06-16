class Api::V1::RoadTripSerializer
  def self.get_roadtrip(origin, destination, trip, destination_forecast)
    # if trip.nil?
    #   trip = double("trip")
    #   allow(trip).to receive(:travel_time).and_return('impossible')
      # allow(trip).to receive(:)
    # end
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          start_city: origin,
          end_city: destination,
          travel_time: trip.travel_time,
          weather_at_eta: {
            temperature: destination_forecast.temp || destination_forecast,
            conditions: destionation_forecast.conditions
          }
        }
      }
    }
  end
end
