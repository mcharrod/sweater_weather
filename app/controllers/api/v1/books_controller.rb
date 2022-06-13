class Api::V1::BooksController < ApplicationController
  def index
    BooksFacade.search_books_by_city(params[:location], params[:quantity])
  end
end
