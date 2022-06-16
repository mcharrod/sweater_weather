class GeoService < BaseService
  def self.get_coordinates(city)
    response = mapquest_conn.get('/geocoding/v1/address') do |faraday|
      faraday.params['location'] = city
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_roadtrip_details(origin, destination)
    response = mapquest_conn.get('/directions/v2/route') do |faraday|
      faraday.params['from'] = origin
      faraday.params['to'] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
