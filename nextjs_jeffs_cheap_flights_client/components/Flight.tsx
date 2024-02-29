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

interface FlightProps {
  flight: {
    departure_token: string;
    flights: FlightLeg[];
    price: string;
    layovers?: string[];
  };
  index: number;
}

const Flight: React.FC<FlightProps> = ({ flight, index }) => (
  <>
    <strong>{index + 1}</strong>
    <div>
      {flight.flights.map((leg, idx_leg) => (
        <React.Fragment key={leg.flight_number}>
          <br />
          Airline: {leg.airline} <img src={leg.airline_logo} alt="Airline logo" /> <br/>
          Leg {idx_leg + 1} of this flight: <br/>
          Departure airport: {leg.departure_airport.name} <br />
          Arrival airport: {leg.arrival_airport.name}
        </React.Fragment>
      ))}
    </div>
    <div>
      Price: {flight.price}<br/>
      Layovers: {flight.layovers ? flight.layovers.length : 0}
    </div>
    <br/>
  </>
);

export default Flight;
