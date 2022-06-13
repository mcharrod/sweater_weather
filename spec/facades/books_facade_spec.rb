require 'rails_helper'

describe 'books facade' do
  it 'returns POROS' do
    result = BooksFacade.search_books_by_city("miami", 5)
    expect(result.first).to be_a(Book)
  end
end
