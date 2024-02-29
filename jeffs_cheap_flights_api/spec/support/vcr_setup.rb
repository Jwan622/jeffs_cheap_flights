require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock # Use WebMock for hooking into HTTP requests
  config.configure_rspec_metadata! # Enable VCR for RSpec tests with :vcr tag
  config.ignore_hosts '127.0.0.1', 'localhost' # Ignore local requests
  config.allow_http_connections_when_no_cassette = false # Disallow HTTP connections when no cassette is used
  config.filter_sensitive_data('<API_KEY>') { ENV['API_KEY'] } # Filter out sensitive data
  config.default_cassette_options = {
    record: :once,
    re_record_interval: 604800
  }
end
