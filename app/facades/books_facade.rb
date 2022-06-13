class BooksFacade
  def self.search_books_by_city(city, limit)
    json = BooksService.search_for_books_by_city(city, limit)
    results_found = json[:numfound]
    array = json[:docs][0..count(limit)].map do |book|
      Book.new(book)
    end
  end

  def self.count(user_input)
    user_input.to_i - 1
  end
end
