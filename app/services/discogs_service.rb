class DiscogsService

  DISCOGS_INFO = { main_url: "https://api.discogs.com/",
                   d_key: Figaro.env.discogs_key,
                   d_secret: Figaro.env.discogs_secret
                  }

  

  

  def initialize(access_hash = nil)
    @access_token = access_hash["access_token"] if access_hash
  end


  def get_token

    url = DISCOGS_INFO[:main_url] += "oauth/request_token"

    response=Faraday.get(url) do |req|
      req["Content-Type"]="application/x-www-form-urlencoded"
      req["Authorization"]="OAuth oauth_consumer_key=#{DISCOGS_INFO[:d_key]}",
        "oauth_nonce=#{ActionController::HttpAuthentication::Digest.nonce(Time.now)}",
        "oauth_signature=#{DISCOGS_INFO[:d_secret]}&",
        "oauth_signature_method=PLAINTEXT",
        "oauth_timestamp=#{Time.now.to_i.to_s}",
        "oauth_callback='http://localhost:3000/auth'"
      req["User-Agent"]="Spinner for Discogs"
    end
byebug
    token=response["oauth_token"]
    secret=response["oauth_token_secret"]
    call_conf=response["oauth_callback_confirmed"]


# request_token?oauth_consumer_key=skqyvDKhrfdPvmnPKgxt&oauth_signature_method=PLAINTEXT&oauth_timestamp=1463192226&oauth_nonce=WDTHpl&oauth_version=1.0a&oauth_signature=UJRiFODxbryJQzctbuUNCZTvxClPuHXP%26



  end

end