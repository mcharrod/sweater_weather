class PhotoService < BaseService
  def self.get_image(city)
    response = unsplash_conn.get('/search/photos') do |faraday|
      faraday.params[:query] = city
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
