class GeoService < BaseService
  def self.get_coordinates(city)
    response = mapquest_conn.get('/geocoding/v1/address') do |faraday|
      faraday.params['location'] = city
    end

    JSON.parse(response.body, symbolize_names: true)
    #
    # latitude = x[:results][0][:locations][0][:latLng][:lat]
    # longitude = x[:results][0][:locations][0][:latLng][:lng]
  end


end
