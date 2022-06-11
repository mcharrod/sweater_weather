class Api::V1::ForecastController < ApplicationController
  def index
    city = params[:location]
    ForecastFacade.current_forecast(city)
  end
end
