class DailyForecast < PoroObject
  attr_reader :daily_date,
              :daily_sunrise,
              :daily_sunset,
              :daily_max_temp,
              :daily_min_temp,
              :daily_conditions,
              :daily_icon
  def initialize(data)
    @daily_date = translate_unix_time(data[:dt])
    @daily_sunrise = translate_unix_time(data[:sunrise])
    @daily_sunset = translate_unix_time(data[:sunset])
    @daily_max_temp = data[:temp][:max]
    @daily_min_temp = data[:temp][:min]
    @daily_conditions = data[:weather][0][:description]
    @daily_icon = data[:weather][0][:icon]
  end
end
