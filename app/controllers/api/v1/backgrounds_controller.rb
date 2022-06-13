class Api::V1::BackgroundsController < ApplicationController
  def show
    background = ImageFacade.get_city_image(params[:location])

    render json: ImageSerializer.image_show(background)
  end
end
