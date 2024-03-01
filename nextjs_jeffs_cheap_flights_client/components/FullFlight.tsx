import React from "react";

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

interface FullFlightProps {
  flight: {
    departure_token: string;
    flights: FlightLeg[];
    price: string;
    layovers?: string[];
  };
  index: number;
}

const FullFlight: React.FC<FullFlightProps> = ({ flight, index }) => {
  const {flights, price, layovers} = flight;

  return (
    <>
      <strong>{index + 1}</strong>
      <div>
        {flights.map(({airline, airline_logo, departure_airport, arrival_airport, flight_number}, idx_leg) => (
          <div key={`${flight_number}-${idx_leg}`}>
            <br/>
            Airline: {airline} <img src={airline_logo} alt={`${airline} logo`} /> <br/>
            Leg {idx_leg + 1} of this flight: <br/>
            Departure airport: {departure_airport.name} <br/>
            Arrival airport: {arrival_airport.name}
          </div>
        ))}
      </div>
      <div>
        Price: {price}
        <p>Layovers: {layovers?.length ? layovers.length : "None"}</p>
      </div>
      <br/>
    </>
  )
};

export default FullFlight;
