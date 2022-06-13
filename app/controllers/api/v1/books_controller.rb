class Api::V1::BooksController < ApplicationController
  def index
    if params[:quantity].nil? || params[:quantity] < 1
      params[:quantity] = 10
      BooksFacade.search_books_by_city(params[:location], params[:quantity])
    end
  end
end
