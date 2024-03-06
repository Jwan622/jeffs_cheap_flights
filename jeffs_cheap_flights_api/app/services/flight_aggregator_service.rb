class FlightAggregatorService
  def self.fetch()
    SerpPresenter.new(SerpClient.fetch()).present
    # A task to do: incorporate other apis and extend the front end to support the new data type
    # kayak_flights = KayakDecorator.new(Kayak.fetch()).decorate
    # return {google_flights: google_flights, kayak_flights: kayak_flights}
  end
end
