class PhotoFacade
  def self.get_city_image(city)
    photo = PhotoService.get_image(city)
    # url = photo[:results][0][:urls][:regular]

    Photo.new(photo)
  end
end
