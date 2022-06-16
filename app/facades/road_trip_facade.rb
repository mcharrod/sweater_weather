class RoadTripFacade
  def self.get_roadtrip_details(origin, destination)
    trip_details = GeoService.find_roadtrip_details(origin, destination)
    # error code 2 means it is an impossible trip
    # if trip_details[:route][:routeError][:errorCode] == 2
    #   trip_details = "impossible trip"
    # elsif
      if trip_details[:route][:formattedTime].present?
        eta = round_time(trip_details[:route][:formattedTime])
        destination_conditions = get_destination_conditions(destination, eta)
        destination_temp = get_destination_temperature(destination, eta)
        RoadTrip.new(trip_details, destination_temp, destination_conditions)
      elsif trip_details[:route][:formattedTime].nil?
        return "impossible trip"
      end 
    end

  def self.round_time(eta)
    binding.pry
    if eta.present?
      hours, minutes, seconds = eta.split(":")
      minutes.to_i > 30 ? hours.ceil : hours.round
    elsif eta.nil?
      return "impossible trip"
    end
  end

  def self.get_destination_temperature(destination, eta)
    if eta == "impossible trip"
      return "impossible trip"
    elsif
      weather = ForecastService.get_current_weather(destination)
      weather[:hourly][eta][:temp]
    end
  end

  def self.get_destination_conditions(destination, eta)
    if eta == "impossible trip"
      return "impossible trip"
    else
      weather = ForecastService.get_current_weather(destination)
      weather[:hourly][eta][:weather][0][:description]
    end
  end
end
