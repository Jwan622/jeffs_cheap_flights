
class FlightFetcher
  def self.fetch()
    data = SerpDecorator.new(Serp.fetch()).decorate
    ap data, options = {color: {
      args:       :pale,
      array:      :white
      }
    }
    return data
    # kayak_flights = KayakDecorator.new(Kayak.fetch()).decorate
    # return {google_flights: google_flights, kayak_flights: kayak_flights}
  end
end
