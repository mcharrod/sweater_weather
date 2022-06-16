class RoadTripFacade
  def self.get_roadtrip_details(origin, destination)
    json = GeoService.find_roadtrip_details(origin, destination)
      return nil if json[:route][:routeError][:errorCode] == 2
    travel_time = round_time(json[:formattedTime])
    destination_conditions = get_destination_conditions(destination, travel_time)
    destination_temp = get_destination_temperature(destination, travel_time)

    RoadTrip.new(json, destination_temp, destination_conditions)
  end

  def self.round_time(travel_time)
    hours, minutes, seconds = travel_time.split(":")
    minutes.to_i > 30 ? hours.ceil : hours.round
  end

  def self.get_destination_temperature(destination, eta)
    weather = ForecastService.get_current_weather(destination)
    weather[:hourly][eta][:temp]
  end

  def self.get_destination_conditions(destination, eta)
    weather = ForecastService.get_current_weather(destination)
    weather[:hourly][eta][:weather][0][:description]
  end
end
