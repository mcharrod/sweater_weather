class Api::V1::BooksController < ApplicationController
  def index
    if params[:quantity].to_i < 1
      render json: Api::V1::ErrorSerializer.list_errors
    else
      current_forecast = ForecastFacade.get_each_weather(params[:location])[0]
      books_list = BooksFacade.search_books_by_city(params[:location], params[:quantity])

      render json: Api::V1::BooksSerializer.list_book_results(books_list, current_forecast, params[:location], params[:quantity])
    end
  end
end
