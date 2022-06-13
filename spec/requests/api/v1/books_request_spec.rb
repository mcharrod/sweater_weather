require 'rails_helper'

describe 'books serializer' do

  it 'retrieves data in proper hash' do
    get api_v1_book_search_path(location: "denver", quantity: 5)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(parsed).to have_key(:data)

    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes][:total_books_found]).to be_an(Integer)
    expect(parsed[:data][:attributes][:destination]).to eq("denver")


    # testing each book in the serializer
    expect(parsed[:data][:attributes][:books]).to be_an(Array)
    parsed[:data][:attributes][:books].each do |book|
      expect(book).to have_key(:isbn)
      expect(book).to have_key(:title)
      expect(book).to have_key(:publisher)
    end
  end

  it 'does not send request for 0 quantity' do
    get api_v1_book_search_path(location: "denver", quantity: 0)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:description]).to eq("invalid input. Please try again.")
  end
end
