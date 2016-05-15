class DiscogsService
  attr_accessor :auth_hash, :user_hash


  def initialize(access_hash = nil)
    @discogs_info = { main_url: "https://api.discogs.com/",
                   d_key: Figaro.env.discogs_key,
                   d_secret: Figaro.env.discogs_secret
                  }
  end


  def get_req_token

    req_token_url = @discogs_info[:main_url] + "oauth/request_token"

    response=Faraday.get(req_token_url) do |req|
      req["Content-Type"]="application/json"
      req["Data-Type"]="jsonp"
      req["Authorization"]="OAuth oauth_consumer_key=#{@discogs_info[:d_key]}",
        "oauth_nonce=#{ActionController::HttpAuthentication::Digest.nonce(Time.now)}",
        "oauth_signature=#{@discogs_info[:d_secret]}&",
        "oauth_signature_method=PLAINTEXT",
        "oauth_timestamp=#{Time.now.to_i.to_s}",
        "oauth_callback=http://localhost:3000/callback"
      req["User-Agent"]="Spinner for Discogs"
    end

    self.auth_hash=extract_tokens(response.body)
    @discogs_info[:exchange_secret] = self.auth_hash["oauth_token_secret"]

  end


  def exchange_token(string)

    ex_hash=extract_tokens(string.split("?")[1])
    ex_token_url = @discogs_info[:main_url] + "oauth/access_token"
    
    response=Faraday.post(ex_token_url) do |req|
      req["Content-Type"]="application/json"
      req["Data-Type"]="jsonp"
      req["Authorization"]="OAuth oauth_consumer_key=#{@discogs_info[:d_key]}",
        "oauth_nonce=#{ActionController::HttpAuthentication::Digest.nonce(Time.now)}",
        "oauth_token=#{ex_hash["oauth_token"]}",
        "oauth_signature=#{@discogs_info[:d_secret]}&#{@discogs_info[:exchange_secret]}",
        "oauth_signature_method=PLAINTEXT",
        "oauth_timestamp=#{Time.now.to_i.to_s}",
        "oauth_verifier=#{ex_hash["oauth_verifier"]}"
      req["User-Agent"]="Spinner for Discogs"
    end
    
    self.user_hash=extract_tokens(response.env.body)
  end

  def search(search_params, token, secret)
  byebug 

    url = @discogs_info[:main_url] + "database/search"

    query=Faraday.get(url) do |req|
      req.params=search_params
      req.params["page"] = 1
      req.params["per_page"]=5
      req["Authorization"]="OAuth oauth_consumer_key=#{@discogs_info[:d_key]}",
        "oauth_token=#{token}",
        "oauth_signature=#{@discogs_info[:d_secret]}&#{secret}",
        "oauth_signature_method=PLAINTEXT",
        "oauth_timestamp=#{Time.now.to_i.to_s}",
        "oauth_nonce=#{ActionController::HttpAuthentication::Digest.nonce(Time.now)}"
    end
    byebug
    results=query.body


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