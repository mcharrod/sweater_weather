class Api::V1::BooksSerializer
  def self.list_book_results(books, forecast, city, limit)
    {
      data: {
        id: nil,
        type: "books",
        attributes: {
          destination: city,
          forecast: {
            summary: forecast.conditions,
            temperature: forecast.temp
          },
          total_books_found: books.count,
          books: books[0..limit.to_i].map do |book|
            {
              isbn: book.isbn,
              title: book.title,
              publisher: book.publisher
            }
          end
        }
      }
    }
  end
end
