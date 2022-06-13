class Book
  attr_reader :title,
              :destination_city,
              :isbn,
              :publisher
  def initialize(data)
    @title = data[:title]
    @destination_city = data[:place][0]
    @isbn = something = data[:edition_key][0]
    @publisher = data[:publisher]
  end

end
