class DiscogsService
  attr_accessor :auth_hash 

  DISCOGS_INFO = { main_url: "https://api.discogs.com/",
                   d_key: Figaro.env.discogs_key,
                   d_secret: Figaro.env.discogs_secret
                  }

  def initialize(access_hash = nil)
    @access_token = access_hash["access_token"] if access_hash
  end


  def get_req_token

    req_token_url = DISCOGS_INFO[:main_url] + "oauth/request_token"
# byebug
    response=Faraday.get(req_token_url) do |req|
      req["Content-Type"]="application/json"
      req["Data-Type"]="jsonp"
      req["Authorization"]="OAuth oauth_consumer_key=#{DISCOGS_INFO[:d_key]}",
        "oauth_nonce=#{ActionController::HttpAuthentication::Digest.nonce(Time.now)}",
        "oauth_signature=#{DISCOGS_INFO[:d_secret]}&",
        "oauth_signature_method=PLAINTEXT",
        "oauth_timestamp=#{Time.now.to_i.to_s}",
        "oauth_callback=http://localhost:3000/callback"
      req["User-Agent"]="Spinner for Discogs"
    end

# byebug
    ### pass response.body to extract_tokens
    # strings=response.body.split("&") 
    # auth={}
    # strings.each do |i|
    #   arr=i.split("=")
    #   auth[arr[0]]=arr[1]
    # end
    # secret=discogs.auth_hash["oauth_token_secret"]

    self.auth_hash=extract_tokens(response.body)
    DISCOGS_INFO[:exchange_secret] = self.auth_hash["oauth_token_secret"]
# byebug

  end

  def exchange_token(string)
# byebug
  #### NEED TOKEN RECEIVED IN CALLBACK PLUS USERS_VERIFIER ###
  ### STRING COMES BACK LIKE THIS: "http://localhost:3000/callback?oauth_token=GdhgMjxQAvXJkmLFYQffINPlkEqHXMHpDWgUhZFE&oauth_verifier=TYgSlghNdL"
  ### string.split("?")[0] -- returns string ready to be processed as above
  ### call extract_tokens with the above: self.WHUT=
  token_hash=extract_tokens(string.split("?")[1])

    ex_token_url = DISCOGS_INFO[:main_url] + "oauth/access_token"
    
    response=Faraday.post(ex_token_url) do |req|
      req["Content-Type"]="application/json"
      req["Data-Type"]="jsonp"
      req["Authorization"]="OAuth oauth_consumer_key=#{DISCOGS_INFO[:d_key]}",
        "oauth_nonce=#{ActionController::HttpAuthentication::Digest.nonce(Time.now)}",
        "oauth_token=#{token_hash["oauth_token"]}",
        "oauth_signature=#{DISCOGS_INFO[:d_secret]}&#{DISCOGS_INFO[:exchange_secret]}",
        "oauth_signature_method=PLAINTEXT",
        "oauth_timestamp=#{Time.now.to_i.to_s}",
        "oauth_verifier=#{token_hash["oauth_verifier"]}"
      req["User-Agent"]="Spinner for Discogs"
    end


byebug

  end

  def extract_tokens(strings_array)
    strings=strings_array.split("&")
    token_hash={}
    strings.each{|i|
      arr=i.split("=")
      token_hash[arr[0]]=arr[1]
    }
    token_hash
  end

end