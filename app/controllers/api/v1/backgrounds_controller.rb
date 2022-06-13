class Api::V1::BackgroundsController < ApplicationController
  def show
    background = PhotoFacade.get_city_image(params[:location])
  end
end
