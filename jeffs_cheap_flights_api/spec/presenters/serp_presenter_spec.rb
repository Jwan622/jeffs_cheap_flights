require 'rails_helper'

RSpec.describe SerpPresenter do
  let(:raw_flight_data) {
    {
      best_flights: "some_value1",
      other_flights: "some_value2",
      price_insights: {
        lowest_price: "some_value3",
        typical_price_range: "some_value4",
        price_level: "some_value5"
      }
    }
  }
  let(:serp_presenter) { SerpPresenter.new(raw_flight_data) }

  describe '#present' do
    it "correctly presents the flight data" do
      expected_output = {
        best_flights: "some_value1",
        other_flights: "some_value2",
        lowest_price: "some_value3",
        typical_price_range: "some_value4",
        price_level: "some_value5"
      }

      expect(serp_presenter.present).to eq(expected_output)
    end
  end
end
