require 'rails_helper'

describe 'books serializer' do
  it 'returns proper data' do
    result = get "/api/v1/books-search?location=denver&quantity=5"


    # expect to have key data
    # expect to have books as an array
    # expect to have the current weather
    # expect to have the right city
  end
end
