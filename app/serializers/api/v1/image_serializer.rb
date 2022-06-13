class Api::V1::ImageSerializer
  def self.image_show(image)
    {
      data: {
        type: "image",
        id: nil,
        attributes: {
          image_url: image.image_url,
          artist_username: image.artist_username
        },
        credit: {
          source: "unsplash.com/developers"
        }
      }
    }
  end
end
