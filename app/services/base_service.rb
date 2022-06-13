class BaseService
  def self.open_weather_conn
    Faraday.new('http://api.openweathermap.org') do |faraday|
      faraday.params['appid'] = ENV['open_weather_api_key']
    end
  end

  def self.mapquest_conn
    Faraday.new('http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['mapquest_api_key']
    end
  end

  def self.unsplash_conn
    Faraday.new('https://api.unsplash.com') do |faraday|
      faraday.params['client_id'] = ENV['unsplash_api_key']
    end
  end
end
