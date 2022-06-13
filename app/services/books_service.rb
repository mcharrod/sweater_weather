class BooksService < BaseService
  def self.search_for_books_by_city(city, quantity)
    response = library_conn.get('search.json') do |faraday|
      faraday.params[:place] = city
      faraday.params[:quantity] = quantity
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
