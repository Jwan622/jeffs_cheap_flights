
class FlightAggregatorService
  def self.fetch()
    data = SerpPresenter.new(SerpClient.fetch()).present

    return data
    # kayak_flights = KayakDecorator.new(Kayak.fetch()).decorate
    # return {google_flights: google_flights, kayak_flights: kayak_flights}
  end
end
