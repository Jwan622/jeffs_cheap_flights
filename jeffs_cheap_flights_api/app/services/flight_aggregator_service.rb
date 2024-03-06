class FlightAggregatorService
  def self.fetch()
    google_flights = SerpPresenter.new(SerpClient.fetch()).present
    amadeus_flights = AmadeusPresenter.new(AmadeusClient.new.fetch()).present

    aggregated = {}
    google_flights.each do |key, value|
      if key == :best_flights or key == :other_flights
        aggregated[key] = value + (amadeus_flights[key] || [])
      elsif key == :lowest_price
        aggregated[key] = [value, amadeus_flights[key]].min
      else
        aggregated[key] = value
      end
    end

    aggregated
  end
end
