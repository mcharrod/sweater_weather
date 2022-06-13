require 'rails_helper'

describe 'books serializer' do

  it 'retrieves data in proper hash' do
    get api_v1_book_search_path(location: "denver", quantity: 5)

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes][:total_books_found]).to be_an(Integer)






  # expect to have key data
  # expect to have books as an array
  # expect to have the current weather
  # expect to have the right city
  end
end
