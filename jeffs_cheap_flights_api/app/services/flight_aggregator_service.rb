class FlightAggregatorService
  PRICE_LEVEL_PRIORITY = {
    low: 2,
    lowest: 1,
    average: 3,
    high: 4
  }.with_indifferent_access

  def self.fetch()
    google_flights = SerpPresenter.new(SerpClient.fetch()).present
    amadeus_flights = AmadeusPresenter.new(AmadeusClient.new.fetch()).present

    combine(google_flights, amadeus_flights)
  end

  private

  def self.combine(google_flights, amadeus_flights)
    combined = google_flights.merge(amadeus_flights) do |key, oldval, newval|
      if key == :price_level
        PRICE_LEVEL_PRIORITY.slice(oldval, newval)
      elsif key == :lowest_price
        [oldval, newval]
      else
        oldval + newval
      end
    end

    combined[:price_level] = combined[:price_level].min_by { |_,v| v }[0]
    combined[:lowest_price] = combined[:lowest_price].min
    combined[:typical_price_range] = [combined[:typical_price_range].min, combined[:typical_price_range].max]

    combined
  end
end
