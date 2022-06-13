class HourlyForecast
  attr_reader :hourly_time,
              :hourly_temp,
              :hourly_conditions,
              :hourly_icon
  def initialize(data)
    @hourly_time = translate_unix_time(data[:dt])
    @hourly_temp = data[:temp]
    @hourly_conditions = data[:weather][0][:description]
    @hourly_icon = data[:weather][0][:icon]
  end

  def translate_unix_time(integer)
    Time.at(integer)
  end
end
