class Api::V1::BooksController < ApplicationController
  def index
    # if params[:quantity].nil? || params[:quantity].to_i < 1
    #   params[:quantity] = 10
      forecast = ForecastFacade.get_each_weather(params[:location])[0]

      books_list = BooksFacade.search_books_by_city(params[:location], params[:quantity])

      render json: Api::V1::BooksSerializer.list_book_results(books_list, forecast)
    # end
  end
end
