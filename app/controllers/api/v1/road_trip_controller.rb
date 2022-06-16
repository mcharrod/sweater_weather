class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      trip = RoadTripFacade.get_roadtrip_details(params[:origin], params[:destination])
        if trip.present?
          destination_forecast = RoadTripFacade.get_destination_weather(params[:destination], trip.travel_time)
        elsif trip.nil?
          destination_forecast = "bingus"
        end
      render json: RoadTripSerializer.get_roadtrip(params[:origin], params[:destination], trip, destination_forecast)
    elsif user.nil?
      render json: { message: "unauthorized: please provide correct API key" }, status: 401
    end
  end
end
