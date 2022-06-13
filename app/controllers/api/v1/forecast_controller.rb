class Api::V1::ForecastController < ApplicationController
  def index
    city = params[:location]
    current_forecast = ForecastFacade.current_forecast(city)

    # PhotoFacade.get_city_image(city)
  end
end
