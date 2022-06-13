class Api::V1::ForecastSerializer
  def self.forecast_index(current_forecast, daily_forecasts, hourly_forecasts)
    {
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: {
            datetime: current_forecast.datetime,
            temperature: current_forecast.temp,
            feels_like: current_forecast.feels_like,
            humidity: current_forecast.humidity,
            uvi: current_forecast.uvi,
            visibility: current_forecast.visibility,
            conditions: current_forecast.conditions,
            icon: current_forecast.icon
          },
          daily_weather: daily_forecasts.map do |daily_forecast|
            {
              date: daily_forecast.daily_date,
              sunrise: daily_forecast.daily_sunrise,
              sunset: daily_forecast.daily_sunset,
              max_temp: daily_forecast.daily_max_temp,
              min_temp: daily_forecast.daily_min_temp,
              conditions: daily_forecast.daily_conditions,
              icon: daily_forecast.daily_icon
            }
          end,
          hourly_weather: hourly_forecasts.map do |hourly_forecast|
            {
              time: hourly_forecast.hourly_time,
              temperature: hourly_forecast.hourly_temp,
              conditions: hourly_forecast.hourly_conditions,
              icon: hourly_forecast.hourly_icon
            }
          end
        }
      }
    }
  end
end
