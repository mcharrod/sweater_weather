require 'rails_helper'

describe 'books facade' do
  before do
    @book_list = BooksFacade.search_books_by_city("miami", 5)
    
  end

  it 'returns POROS' do
    this_book = @book_list.first
    expect(this_book).to be_a(Book)
  end
end
