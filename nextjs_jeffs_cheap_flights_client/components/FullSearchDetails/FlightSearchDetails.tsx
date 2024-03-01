import React from 'react';
import styles from './FlightSearchDetails.module.css';

interface FlightSearchDetailsProps {
  flights: {
    lowest_price: string,
    typical_price_range: string[],
    price_level: string,
  },
  className: string;
}
const FlightSearchDetails: React.FC<FlightSearchDetailsProps> = ({flights, className}) => (
  <div className={className}>
    <div className={styles.detailHeader}>Other Route Deets:</div>
    <div className={styles.detail}>Lowest Price: ${flights.lowest_price}</div>
    <div className={styles.detail}>Typical Price Range: ${flights.typical_price_range[0]} - ${flights.typical_price_range[1]}</div>
    <div className={styles.detail}>Price Level: {flights.price_level[0].toUpperCase() + flights.price_level.slice(1)}</div>
  </div>
)

export default FlightSearchDetails

