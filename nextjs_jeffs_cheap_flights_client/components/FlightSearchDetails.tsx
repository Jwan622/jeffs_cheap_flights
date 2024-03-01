import React from 'react';


interface FlightSearchDetailsProps {
  flights: {
    lowest_price: string,
    typical_price_range: string,
    price_level: string
  }
}
const FlightSearchDetails: React.FC<FlightSearchDetailsProps> = (props) => (
    <div>
      <h3>Other Route Deets:</h3>
      <div>Lowest Price: {props.flights.lowest_price}</div>
      <div>Typical Price Range: {props.flights.typical_price_range}</div>
      <div>Price Level: {props.flights.price_level}</div>
    </div>
)

export default FlightSearchDetails

