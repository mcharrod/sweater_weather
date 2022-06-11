class ForecastFacade
  def self.current_forecast(city)
    ForecastService.get_current_weather(city)
  end
end
