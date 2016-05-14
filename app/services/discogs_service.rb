class DiscogsService
  attr_accessor :auth_hash 

  DISCOGS_INFO = { main_url: "https://api.discogs.com/",
                   d_key: Figaro.env.discogs_key,
                   d_secret: Figaro.env.discogs_secret
                  }

  def initialize(access_hash = nil)
    @access_token = access_hash["access_token"] if access_hash
  end


  def get_token

    url = DISCOGS_INFO[:main_url] += "oauth/request_token"
# byebug
    response=Faraday.get(url) do |req|
      req["Content-Type"]="application/json"
      req["Data-Type"]="jsonp"
      req["Authorization"]="OAuth oauth_consumer_key=#{DISCOGS_INFO[:d_key]}",
        "oauth_nonce=#{ActionController::HttpAuthentication::Digest.nonce(Time.now)}",
        "oauth_signature=#{DISCOGS_INFO[:d_secret]}&",
        "oauth_signature_method=PLAINTEXT",
        "oauth_timestamp=#{Time.now.to_i.to_s}",
        "oauth_callback='http://localhost:3000/callback'"
      req["User-Agent"]="Spinner for Discogs"
    end

# byebug
    strings=response.body.split("&")
    auth={}
    strings.map do |i|
      arr=i.split("=")
      auth[arr[0]]=arr[1]
    end

    self.auth_hash=auth
byebug

  end

end