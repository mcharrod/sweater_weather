require 'rails_helper'

describe 'books service' do
  result = BooksService.search_for_books_by_city("denver", 5)
  expect(result)
end
