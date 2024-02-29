require 'rails_helper'

RSpec.describe SerpClient,  :vcr, type: :service do
  describe '.fetch' do
    it 'returns a hash' do
      response = SerpClient.fetch

      expect(response).to be_a(Hash)
    end

    it 'fetches flight data' do
      data = SerpClient.fetch

      expect(data.keys.map &:to_sym).to match_array([:search_parameters, :search_metadata, :best_flights, :other_flights, :price_insights])
      expect(data["price_insights"].keys.map &:to_sym).to match_array([:lowest_price, :price_level, :typical_price_range, :price_history])
    end
  end
end
