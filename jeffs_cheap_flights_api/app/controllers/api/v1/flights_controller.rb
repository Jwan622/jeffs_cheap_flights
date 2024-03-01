class Api::V1::FlightsController < ApplicationController
  def index
    @flights = FlightAggregatorService.fetch()

    render json: @flights
  end
end
