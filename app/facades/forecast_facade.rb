class ForecastFacade
  def self.get_each_weather(city)
    all_weather = ForecastService.get_current_weather(city)

    current = CurrentForecast.new(all_weather)

    daily = all_weather[:daily][0..4].map do |daily_forecast|
      DailyForecast.new(daily_forecast)
    end

    hourly = all_weather[:hourly][0..7].map do |hourly_forecast|
      HourlyForecast.new(hourly_forecast)
    end

    [current, daily, hourly]
  end

  def get_hourly_weather(weather)
  end

  def get_daily_weather(weather)
  end
end
