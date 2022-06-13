class Photo
  attr_reader :image_url
  def initialize(data)
    @image_url = data[:results][0][:urls][:regular]
  end
end
