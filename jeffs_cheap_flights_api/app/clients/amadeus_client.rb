require 'httparty'
class AmadeusClient
  include HTTParty
  base_uri Dotenv.parse(".env.local", ".env")['AMADEUS_BASE_URI']

  attr_reader :params, :access_token

  def initialize
    @client_id = Dotenv.parse(".env.local", ".env")['AMADEUS_API_KEY']
    @client_secret = Dotenv.parse(".env.local", ".env")['AMADEUS_SECRET_KEY']
    @params = {
      originLocationCode: 'JFK',
      destinationLocationCode: 'MAD',
      departureDate: '2024-04-01',
      returnDate: '2024-04-24',
      adults: 1,
      travelClass: 'ECONOMY',
      nonStop: false,
      max: 50
    }
  end

  def fetch
    authenticate unless @access_token

    headers = {
      "Authorization" => "Bearer #{@access_token}"
    }
    Rails.logger.info("Fetching Amadeus flights...")
    self.class.get("/v2/shopping/flight-offers", query: @params, headers: headers)
    Rails.logger.info("Fetched Amadeus flights...")
  end

  private
  def authenticate
    options = {
      body: {
        grant_type: 'client_credentials',
        client_id: @client_id,
        client_secret: @client_secret
      },
      headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
    }
    Rails.logger.info('about to authenticate with Amadeus')
    response = self.class.post('/v1/security/oauth2/token', body: {
      grant_type: 'client_credentials',
      client_id:@client_id,
      client_secret:@client_secret
    },
    headers: { 'Content-Type' => 'application/x-www-form-urlencoded' })

    if response.code == 200
      Rails.logger.info('Authentication with Amadeus successful!')
      @access_token = response.parsed_response['access_token']
    else
      raise "Authentication Failed: #{response.code} - #{response.message}, Body: #{response.body}"
    end
  end
end
