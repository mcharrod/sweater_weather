class Book
  attr_reader :title,
              :destination_city,
              :isbn,
              :publisher
  def initialize(data)
    @title = data[:title]
    @isbn = data[:edition_key][0]
    @publisher = data[:publisher]
  end
end
