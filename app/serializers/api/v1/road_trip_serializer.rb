class Api::V1::RoadTripSerializer
  def self.get_roadtrip(origin, destination, trip)
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          start_city: origin,
          end_city: destination,
          travel_time: trip.travel_time,
          weather_at_eta: {
            temperature: trip.destination_temp,
            conditions: trip.destination_conditions
          }
        }
      }
    }
  end
end
