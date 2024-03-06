class FlightAggregatorService
  def self.fetch()
    google_flights = SerpPresenter.new(SerpClient.fetch()).present
    amadeus_flights = AmadeusPresenter.new(AmadeusClient.new.fetch()).present

    google_flights.merge(amadeus_flights) { |key, oldval, newval| oldval + newval }
  end
end
