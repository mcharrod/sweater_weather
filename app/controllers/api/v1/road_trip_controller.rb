class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      trip = RoadTripFacade.get_roadtrip_details(params[:origin], params[:destination])
        if trip == "impossible trip"
          render json: { message: "bingus says your trip is impossible"}
        else
          destination_conditions = RoadTripFacade.get_destination_conditions(params[:destination], trip.travel_time)
          render json: RoadTripSerializer.get_roadtrip(params[:origin], params[:destination], trip, destination_forecast)
        end
    elsif user.nil?
      render json: { message: "unauthorized: please provide correct API key" }, status: 401
    end
  end
end
