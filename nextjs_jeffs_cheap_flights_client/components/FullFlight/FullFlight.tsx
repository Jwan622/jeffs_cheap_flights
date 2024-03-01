import React from "react";
import styles from './FullFlight.module.css';


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
    <div className={styles.flightContainer}>
      <div className={styles.flightHeader}>{index + 1}</div>
      {flights.map(({airline, airline_logo, departure_airport, arrival_airport, flight_number}, idx_leg) => (
        <div key={`${flight_number}-${idx_leg}`} className={styles.flightLeg}>
          <img src={airline_logo} alt={`${airline} logo`} className={styles.airlineLogo} />
          <div className={styles.flightInfo}>Airline: {airline}</div>
          <div className={styles.flightInfo}>Leg {idx_leg + 1} of this flight:</div>
          <div className={styles.flightInfo}>Departure airport: {departure_airport.name}</div>
          <div className={styles.flightInfo}>Arrival airport: {arrival_airport.name}</div>
        </div>
      ))}
      <div className={styles.priceInfo}>
        Price: ${price}
      </div>
      <p className={styles.layoversInfo}>Layovers: {layovers?.length ? layovers.length : "None"}</p>
    </div>
  );
};

export default FullFlight;
