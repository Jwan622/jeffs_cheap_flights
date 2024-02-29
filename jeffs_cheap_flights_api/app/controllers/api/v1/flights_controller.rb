class Api::V1::FlightsController < ApplicationController
  def index
    @routes = FlightFetcher.fetch()

    render json: @routes
  end
end
