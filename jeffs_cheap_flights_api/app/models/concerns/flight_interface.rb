module FlightInterface
  def best_flights
    raise NotImplementedError
  end
  def other_flights(serp_data)
    raise NotImplementedError
  end

  def lowest_price
    raise NotImplementedError
  end
  def typical_price_range
    raise NotImplementedError
  end

  def price_level
    raise NotImplementedError
  end
end
