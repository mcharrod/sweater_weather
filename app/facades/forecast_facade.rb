class ForecastFacade
  def self.current_forecast(city)
    weather = ForecastService.get_current_weather(city)

    CurrentForecast.new(weather)
  end
end
