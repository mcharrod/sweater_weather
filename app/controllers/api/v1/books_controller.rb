class Api::V1::BooksController < ApplicationController
  def index
    current_forecast = ForecastFacade.get_each_weather(params[:location])[0]
    books_list = BooksFacade.search_books_by_city(params[:location], params[:quantity])

    render json: Api::V1::BooksSerializer.list_book_results(books_list, current_forecast)
  end
end
