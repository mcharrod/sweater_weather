class ImageFacade
  def self.get_city_image(city)
    image = ImageService.get_image(city)
    # url = image[:results][0][:urls][:regular]

    Image.new(image)
  end
end
