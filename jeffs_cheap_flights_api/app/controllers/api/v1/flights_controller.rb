class Api::V1::FlightsController < ApplicationController
  def index
    @flights = FlightFetcher.fetch()

    render json: @flights
  end
end
