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
  - Usage of `vcr` to record external API calls so we don't burn out our 100 api limit from Serp  
  - Rails 7 is better tested.  
  - Unit and integration tests  
  - API calls to SerpAPI
  - API calls to Amadeus Flights
  - Conforming different data from the APIs to a singular contract
  - Usage of presenters
  - No database needed here for the functional API app
  - Testing

React highlights include:  
  - Functional React components using TypeScript and NextJS  
  - CSS Grid


# Some teaching highlights
- How to expose an API
- How to consume an API
- Going over CORS and how to have a more stringest cross origin policy than just `origin *`
- Unit Test and Integration Testing
- Using VCR to find a balance between mocking api calls entirely and using a real api
- Separation of concerns. What should the api client do? What should the presenter do? What should the flight fetcher service do?
- MVC architecture. Controller should be dumb and just connect the services and models and expose the data.
- TODO: More testing topics. query vs command, factoryboy and fake data, shoulda matchers.
