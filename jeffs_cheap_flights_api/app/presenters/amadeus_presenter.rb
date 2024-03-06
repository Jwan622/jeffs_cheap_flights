class AmadeusPresenter
  attr_reader :amadeus_data
  def initialize(data)
    @amadeus_data = data
  end

  def present
    {
      best_flights: best_flights,
      other_flights: other_flights,
      lowest_price: lowest_price,
      typical_price_range: typical_price_range,
      price_level: price_level
    }
  end

  private

  def best_flights
    # [
    #   {
    #     departure_token: <string>,
    #     flights: [
    #       {
    #         airline: <string>,
    #         airline_logo: <string>,
    #         departure_airport: { name: <string> },
    #         arrival_airport: { name: <string> },
    #         flight_number: <string>
    #       }
    #     ],
    #     price: <string>
    #     layovers: [<string of airport codes>]
    #   }
    # ]
    amadeus_data[:best_flights]
  end

  def other_flights
    # [
    #   {
    #     departure_token: <string>,
    #     flights: [
    #       {
    #         airline: <string>,
    #         airline_logo: <string>,
    #         departure_airport: { name: <string> },
    #         arrival_airport: { name: <string> },
    #         flight_number: <string>
    #       }
    #     ],
    #     price: <string>
    #       layovers: [<string of airport codes>]
    #   }
    # ]
    amadeus_data[:other_flights]
  end

  def lowest_price
    price_insights[:lowest_price]
  end
  def typical_price_range
    price_insights[:typical_price_range]
  end

  def price_level
    price_insights[:price_level]
  end

  def price_insights
    amadeus_data[:price_insights]
  end
end
