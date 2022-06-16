class RoadTrip
  attr_reader :travel_time,
              :start_city,
              :end_city


  def initialize(data, destination_temp, destination_conditions)
    @start_city = data[:route][:locations][0][:adminArea5]
    @end_city = data[:route][:locations][1][:adminArea5]
    @travel_time = human_read_travel_time(data[:route][:formattedTime])
  end

  def human_read_travel_time(travel_time)
    hours, minutes, seconds = travel_time.split(":")

    hours + " hours and " + minutes + " minutes."
  end


end
