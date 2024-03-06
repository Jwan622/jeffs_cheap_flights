require 'rails_helper'

RSpec.describe FlightAggregatorService do
  let(:amadeus_client) { instance_double(AmadeusClient)}
  let(:raw_data_serp) { { flights: 'raw data from SerpClient' } }
  let(:raw_data_amadeus) { { flights: 'raw data from AmadeusClient' } }
  let(:presented_data_serp) { { price_level: "lowest", lowest_price: 200, typical_price_range: [100,900] } }
  let(:presented_data_amadeus) { { price_level: "low", lowest_price: 199, typical_price_range: [103,800] } }
  let(:serp_presenter_instance) { instance_double(SerpPresenter, present: presented_data_serp) }
  let(:amadeus_presenter_instance) { instance_double(AmadeusPresenter, present: presented_data_amadeus) }

  describe '.fetch' do
    before :each do
      allow(SerpClient).to receive(:fetch).and_return(raw_data_serp)
      allow(AmadeusClient).to receive(:new).and_return(amadeus_client)
      allow(amadeus_client).to receive(:fetch).and_return(raw_data_amadeus)
      allow(SerpPresenter).to receive(:new).with(raw_data_serp).and_return(serp_presenter_instance)
      allow(AmadeusPresenter).to receive(:new).with(raw_data_amadeus).and_return(amadeus_presenter_instance)
    end

    describe 'amadeus' do
      it 'fetches flight data from amadeus' do
        described_class.fetch

        expect(amadeus_client).to have_received(:fetch)
      end

      it 'presents flight data from Amadeus' do
        described_class.fetch

        expect(AmadeusPresenter).to have_received(:new).with(raw_data_amadeus)
      end
    end

    describe 'serp' do
      it 'fetches flight data from serp' do
        described_class.fetch

        expect(SerpClient).to have_received(:fetch)
      end
      it 'presents flight data from Serp' do
        described_class.fetch

        expect(SerpPresenter).to have_received(:new).with(raw_data_serp)
      end
    end

    it 'returns combined flight data' do
      expect(described_class.fetch).to eq({price_level: 'lowest', lowest_price: 199, typical_price_range: [100,900]})
    end
  end
end
