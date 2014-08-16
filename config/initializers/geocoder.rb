Geocoder.configure(
  # geocoding options
  :timeout      => 8,                               # geocoding service timeout (secs)
  :language     => :en,                             # ISO-639 language code
  :lookup       => :google,                         # name of geocoding service (symbol)
  :use_https    => true,                            # use HTTPS for lookup requests? (if supported)
  :api_key      => ENV['GOOGLE_LOCATION_API_KEY'],  # API key for geocoding service
  # Get a new key under: https://code.google.com/apis/console (log in with your Google Account)
  # Click the Services link from the left-hand menu in the APIs Console, then activate the Geocoding API and generate a new key


  # :http_proxy   => nil,               # HTTP proxy server (user:pass@host:port)
  # :https_proxy  => nil,               # HTTPS proxy server (user:pass@host:port)
  # :cache        => nil,               # cache object (must respond to #[], #[]=, and #keys)
  # :cache_prefix => "geocoder:",       # prefix (string) to use for all cache keys

  # exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and TimeoutError
  # :always_raise => [],


  # calculation options
  :units     => :km,          # :km for kilometers or :mi for miles
  :distances => :spherical    # :spherical or :linear
)
