require 'rails_helper'

describe 'books facade' do
  before do
    result = BooksFacade.search_books_by_city("miami", 5)
  end
  it 'returns POROS' do
    this_book = result.first
    expect(this_book).to be_a(Book)
  end

  it 'search results do not exceed quantity' do
    boolean = result[:docs].count < 5

    expect(boolean).to eq(true)
  end
end
