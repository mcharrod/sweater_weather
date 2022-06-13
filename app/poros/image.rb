class Image
  attr_reader :image_url,
              :artist_username
  def initialize(data)
    @image_url = data[:results][0][:urls][:regular]
    @artist_username = data[:results][0][:user][:username]
  end
end
