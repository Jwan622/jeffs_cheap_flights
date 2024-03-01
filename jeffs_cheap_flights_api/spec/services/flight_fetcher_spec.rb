require 'rails_helper'

RSpec.describe FlightAggregatorService do
  let(:raw_data) { { flights: 'raw data from SerpClient' } }
  let(:decorated_data) { { flights: 'decorated data' } }
  let(:serp_decorator_instance) { instance_double(SerpPresenter, present: decorated_data) }

  describe '.fetch' do
    before :each do
      allow(SerpClient).to receive(:fetch).and_return(raw_data)
      allow(SerpPresenter).to receive(:new).with(raw_data).and_return(serp_decorator_instance)
    end

    it 'fetches flight data' do
      described_class.fetch

      expect(SerpClient).to have_received(:fetch)
    end

    it 'decorates flight data' do
      described_class.fetch

      expect(SerpPresenter).to have_received(:new).with(raw_data)
    end

    it 'returns decorated flight data' do
      expect(described_class.fetch).to eq(decorated_data)
    end
  end
end
