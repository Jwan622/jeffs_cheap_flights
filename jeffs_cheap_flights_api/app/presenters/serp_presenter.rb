class SerpPresenter
  include FlightInterface

  attr_reader :serp_data
  def initialize(serp_data)
    @serp_data = serp_data
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
    serp_data[:best_flights]
  end

  def other_flights
    serp_data[:other_flights]
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
    serp_data[:price_insights]
  end
end
