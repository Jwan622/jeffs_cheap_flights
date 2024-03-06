class Api::V1::FlightsController < ApplicationController
  def index
    render json: FlightAggregatorService.fetch()
  end
end
