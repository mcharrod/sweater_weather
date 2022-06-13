class Api::V1::BooksSerializer
  def self.list_book_results(books, forecast)
    {
      data: {
        id: nil,
        type: "books",
        attributes: {
          destination: books.first.destination_city,
          forecast: {
            summary: forecast.conditions,
            temperature: forecast.temp
          },
          total_books_found: books.count,
          books: books.map do |book|
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
