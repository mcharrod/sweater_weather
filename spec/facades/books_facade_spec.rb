require 'rails_helper'

describe 'books facade' do

  it 'returns POROS' do
    VCR.use_cassette("Facade returns an array of books") do
      @book_list = BooksFacade.search_books_by_city("miami", 5)

      this_book = @book_list.first
      expect(this_book).to be_a(Book)
    end 
  end
end
