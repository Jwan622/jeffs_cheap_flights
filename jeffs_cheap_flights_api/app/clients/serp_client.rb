require 'google_search_results'
class SerpClient
  def self.fetch()
    params = {
      q: '', # I think this is just a useless param
      engine: "google_flights",
      departure_id: "JFK",
      arrival_id: "MAD",
      outbound_date: "2024-04-01",
      return_date: "2024-04-24",
      currency: "USD",
      hl: "en",
      api_key: Dotenv.parse(".env.local", ".env")['SERP_API_KEY']
    }

    Rails.logger.info("Fetching Google flights...")
    search = GoogleSearch.new(params)
    Rails.logger.info("Fetched Google flights...")

    return search.get_hash.with_indifferent_access
  end
end
