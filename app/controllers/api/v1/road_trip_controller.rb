class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      trip = RoadTripFacade.get_roadtrip_details(params[:origin], params[:destination])
        if trip == "impossible trip"
          render json: { message: "trip is impossible"}
        else
          destination_conditions = RoadTripFacade.get_destination_conditions(params[:destination], trip.travel_time)
          render json: Api::V1::RoadTripSerializer.get_roadtrip(params[:origin], params[:destination], trip)
        end
    elsif user.nil?
      render json: { message: "bad request please try again" }, status: 401
    end
  end
end
