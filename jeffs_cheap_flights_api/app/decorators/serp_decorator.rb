class SerpDecorator
  include FlightInterface

  attr_reader :serp_data
  def initialize(serp_data)
    @serp_data = serp_data
  end

  def decorate
    {
      best_flights: best_flights(serp_data),
      other_flights: other_flights(serp_data),
      lowest_price: lowest_price,
      typical_price_range: typical_price_range,
      price_level: price_level
    }
  end

  def best_flights(serp_data)
    serp_data['best_flights']
  end

  def other_flights(serp_data)
    serp_data['other_flights']
  end

  def lowest_price
    price_insights(serp_data)['lowest_price']
  end
  def typical_price_range
    price_insights(serp_data)['typical_price_range']
  end

  def price_level
    price_insights(serp_data)['price_level']
  end

  private

  def price_insights(serp_data)
    serp_data['price_insights']
  end
end
