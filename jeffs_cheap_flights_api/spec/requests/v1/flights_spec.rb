require 'rails_helper'

RSpec.describe Api::V1::FlightsController, :vcr, type: :request do
  describe "GET api/v1/flights" do
    it "returns http success" do
      get "/api/v1/flights"

      expect(response).to have_http_status(:success)
    end

    it 'calls fetch' do
      allow(FlightFetcher).to receive(:fetch).and_return([])

      get "/api/v1/flights"

      expect(FlightFetcher).to have_received(:fetch)
    end
    it "returns flights json" do
      get "/api/v1/flights"

      expect(response.header['Content-Type']).to include "application/json"
    end
  end
end
