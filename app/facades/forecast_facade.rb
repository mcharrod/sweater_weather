class ForecastFacade
  def self.get_each_weather(city)
    all_weather = ForecastService.get_current_weather(city)

    current = CurrentForecast.new(all_weather[:current])
    hourly = get_hourly_weather(all_weather[:hourly])
    daily = get_daily_weather(all_weather[:daily])

    [current, daily, hourly]
  end

  def self.get_hourly_weather(weather)
    weather.map do |hourly_forecast|
      HourlyForecast.new(hourly_forecast)
    end
  end

  def self.get_daily_weather(weather)
    weather.map do |daily_weather|
      DailyForecast.new(daily_weather)
    end
  end
end
