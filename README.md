# Getting started

This is a quick mvp of a Rails 7 backend that consume Google Flights data via SerpAPI with a NextJS react app that
displays that data after consuming it from the rails endpoint.

# Up and Running

1. `cd` into the `jeffs_cheap_flights_api` repo and run: 
  - `bundle install` 
  - `rails db:create`
  - `rails db:migrate`
  - `rails server`
2. `cd` into the `nextjs_jeffs_cheap_flights_client` repo and run:
   - `yarn install`
   - `yarn dev`


# Some Highlights
 
Rails Highlights include:   
  - usage of `vcr` to record external API calls so we don't burn out our 100 api limit from Serp  
  - Rails 7 is better tested.  
  - Unit and integration tests  
  - API calls to SerpAPI  
  - exposure of the API via cors  
  - No database needed here for the functional API app  

React highlights include:  
  - Functional React components using TypeScript and NextJS  
