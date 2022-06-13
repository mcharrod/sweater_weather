class ImageService < BaseService
  def self.get_image(city)
    response = unsplash_conn.get('/search/photos') do |faraday|
      faraday.params[:query] = city
      faraday.params[:orientation] = "landscape"
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
