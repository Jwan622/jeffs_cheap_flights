class FlightAggregatorService
  def self.fetch()
    google_flights = SerpPresenter.new(SerpClient.fetch()).present
    puts 'about to hit amadeus presneter'
    amadeus_flights = AmadeusPresenter.new(AmadeusClient.new.fetch()).present
    # A task to do: incorporate other apis and extend the front end to support the new data type. Look into https://developers.amadeus.com/self-service/category/flights/api-doc/flight-offers-search
    # kayak_flights = KayakDecorator.new(Kayak.fetch()).decorate
    return {
      google_flights: google_flights, amadeus_flights: amadeus_flights
    }
  end
end
