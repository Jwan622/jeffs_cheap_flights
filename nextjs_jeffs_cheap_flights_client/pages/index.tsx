import React, { useState, useEffect } from 'react';
import fetch from 'isomorphic-unfetch';
import Flight from '../components/Flight'; // Ensure Flight component is also converted to TypeScript

interface FlightsState {
  best_flights: FlightData[];
  other_flights: FlightData[];
  lowest_price: string;
  typical_price_range: string;
  price_level: string;
}
interface FlightData {
  departure_token: string; // Assuming this is a unique identifier
  flights: FlightLeg[];
  price: string;
  layovers?: string[]; // Optional, based on your current structure
}

interface FlightLeg {
  airline: string;
  airline_logo: string;
  departure_airport: {
    name: string;
  };
  arrival_airport: {
    name: string;
  };
  flight_number: string;
}


const App: React.FC = () => {
  const [flights, setFlights] = useState<FlightsState>({
    best_flights: [],
    other_flights: [],
    lowest_price: '',
    typical_price_range: '',
    price_level: ''
  });
  const [isLoading, setIsLoading] = useState<boolean>(true);

  useEffect(() => {
    const fetchData = async () => {
      setIsLoading(true);
      try {
        await new Promise(resolve => setTimeout(resolve, 1500));

        const res = await fetch("http://localhost:3000/api/v1/flights");
        if (!res.ok) throw new Error('Failed to fetch');

        const data = await res.json() as FlightsState;
        setFlights(data);
      } catch (error) {
        console.error('Fetch error:', error);
      } finally {
        setIsLoading(false); // Use finally to ensure loading state is updated regardless of fetch success
      }
    };

    fetchData();
  }, []);

  if (isLoading) return <div>Loading...</div>;

  return (
    <div>
      <h1>Best Flights</h1>
      {flights.best_flights.map((flight, index) => (
        <Flight key={flight.departure_token} flight={flight} index={index} />
      ))}

      <h2>Other Flights</h2>
      {flights.other_flights.map((flight, index) => (
        <Flight key={flight.departure_token} flight={flight} index={index} />
      ))}

      <div>
        <h3>Other Route Deets:</h3>
        <div>Lowest Price: {flights.lowest_price}</div>
        <div>Typical Price Range: {flights.typical_price_range}</div>
        <div>Price Level: {flights.price_level}</div>
      </div>
    </div>
  );
};

export default App;
