import React from 'react';
import styles from './FlightSearchDetails.module.css';
interface FlightSearchDetailsProps {
  flights: {
    lowest_price: string,
    typical_price_range: string,
    price_level: string,
  },
  className: string;
}
const FlightSearchDetails: React.FC<FlightSearchDetailsProps> = ({flights, className}) => (
  <div className={className}>
    <div className={styles.detailHeader}>Other Route Deets:</div>
    <div className={styles.detail}>Lowest Price: ${flights.lowest_price}</div>
    <div className={styles.detail}>Typical Price Range: ${flights.typical_price_range}</div>
    <div className={styles.detail}>Price Level: {flights.price_level}</div>
  </div>
)

export default FlightSearchDetails

