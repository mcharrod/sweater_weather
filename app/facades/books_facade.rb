class BooksFacade
  def self.search_books_by_city(city, quantity)
    BooksService.search_for_books_by_city(city, quantity)
  end
end
