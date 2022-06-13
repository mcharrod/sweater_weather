class BooksFacade
  def self.search_books_by_city(city, limit)
    json = BooksService.search_for_books_by_city(city, limit)

    json[:docs].map do |book|
      Book.new(book)
    end
  end
end
