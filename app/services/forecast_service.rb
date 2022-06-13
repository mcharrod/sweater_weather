class ForecastService < BaseService
  def self.get_current_weather(city)
    coordinates = GeoService.get_coordinates(city)

    response = open_weather_conn.get('/data/2.5/onecall') do |faraday|

    faraday.params['lat'] = coordinates[:results][0][:locations][0][:latLng][:lat]
    faraday.params['lon'] = coordinates[:results][0][:locations][0][:latLng][:lng]
    faraday.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)

  end
end
