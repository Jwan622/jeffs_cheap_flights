require 'httparty'
class AmadeusClient
  include HTTParty
  base_uri 'https://test.api.amadeus.com'
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

    self.class.get("/v2/shopping/flight-offers", query: @params, headers: headers)
  end
  def authenticate
    # URI.encode_www_form ensures the body is URL-encoded.
    options = {
      body: {
        grant_type: 'client_credentials',
        client_id: @client_id,
        client_secret: @client_secret
      },
      headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
    }
    puts options, 'options before opst'
    response = self.class.post('/v1/security/oauth2/token', body: {
      grant_type: 'client_credentials',
      client_id:@client_id,
      client_secret:@client_secret
    },
    headers: { 'Content-Type' => 'application/x-www-form-urlencoded' })

    # Logging the entire response object and the body for debugging
    puts "Response Object: #{response.inspect}"
    puts "Response Body: #{response.body}"

    if response.code == 200
      @access_token = response.parsed_response['access_token']
    else
      raise "Authentication Failed: #{response.code} - #{response.message}, Body: #{response.body}"
    end
  end
end
