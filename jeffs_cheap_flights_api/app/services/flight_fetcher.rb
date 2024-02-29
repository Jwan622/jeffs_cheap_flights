
class FlightFetcher
  def self.fetch()
    data = SerpDecorator.new(SerpClient.fetch()).decorate

    return data
    # kayak_flights = KayakDecorator.new(Kayak.fetch()).decorate
    # return {google_flights: google_flights, kayak_flights: kayak_flights}
  end
end
