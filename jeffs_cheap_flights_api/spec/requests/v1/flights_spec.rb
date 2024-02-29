require 'rails_helper'

RSpec.describe "Flights", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/flights"
      expect(response).to have_http_status(:success)
    end

    it "returns flights" do
      get "/api/v1/flights"

      test_flights = ['nyc': 'vegas']
      allow(FlightFetcher).to receive(:fetch).and_return(test_flights)

      puts("response #{response}")
      json = JSON.parse(response.body)

      expect(json).to eq({
         nyc: 'vegas'
      })

      expect(response.status).to eq(200)
    end
  end
end
