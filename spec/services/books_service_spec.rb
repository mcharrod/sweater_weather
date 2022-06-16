# require 'rails_helper'
#
# describe 'books service' do
#   before do
#     @result = BooksService.search_for_books_by_city("denver", 5)
#   end
#
#   it 'returns search results in a hash' do
#     expect(@result).to have_key(:numFound)
#     expect(@result).to have_key(:start)
#     expect(@result[:docs]).to be_an(Array)
#     expect(@result[:docs][0]).to have_key(:seed)
#     expect(@result).to have_key(:start)
#   end
# end
