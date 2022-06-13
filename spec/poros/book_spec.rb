require 'rails_helper'

describe 'book PORO' do
  before do
    @books = BooksFacade.search_books_by_city("denver", 5)
    @this_book = @books.first
  end

  it 'exists' do
    expect(@this_book).to be_a(Book)
  end

  it 'has attributes' do
    expect(@this_book.title).to be_a(String)
    expect(@this_book.isbn).to be_a(String)
    expect(@this_book.title).to be_a(String)
  end
end
