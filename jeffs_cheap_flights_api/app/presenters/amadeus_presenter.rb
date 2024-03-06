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
    [
      {
        departure_token: 'some token1',
        flights: [
          {
            airline: 'some fake amadeus airline',
            airline_logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Pan_Am_Logo.svg/1200px-Pan_Am_Logo.svg.png',
            departure_airport: { name: 'some fake amadeus airline' },
            arrival_airport: { name: 'some fake amadeus arrival airline' },
            flight_number: 'some fake airline number'
          },
          {
            airline: 'some fake amadeus airline2',
            airline_logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Pan_Am_Logo.svg/1200px-Pan_Am_Logo.svg.png',
            departure_airport: { name: 'some fake amadeus airline from layoever' },
            arrival_airport: { name: 'some fake amadeus arrival airline final airport' },
            flight_number: 'some fake airline number'
          }
        ],
        price: '100',
        layovers: ['LUB', 'BER']
      }
    ]
  end

  def other_flights
    [
      {
        departure_token: 'some token1',
        flights: [
          {
            airline: 'some fake amadeus airline',
            airline_logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Pan_Am_Logo.svg/1200px-Pan_Am_Logo.svg.png',
            departure_airport: { name: 'some fake amadeus airline other glights' },
            arrival_airport: { name: 'some fake amadeus arrival airline other flights' },
            flight_number: 'some fake airline number'
          }
        ],
        price: '100',
        layovers: ['LUB', 'BER']
      }
    ]
  end

  def lowest_price
    200
  end
  def typical_price_range
    [100,200]
  end

  def price_level
    'lowest'
  end

  def price_insights
    {}
  end
end
