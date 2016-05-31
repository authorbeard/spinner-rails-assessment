class DiscogsController < ApplicationController


  def start_req
    discogs=DiscogsService.new
    auth_hash=discogs.get_req_token
    token=discogs.auth_hash["oauth_token"]

    redirect_to("https://discogs.com/oauth/authorize?oauth_token=#{token}")
  end

  def callback

    auth_string = response.request.env["REQUEST_URI"]

    discogs=DiscogsService.new
    discogs.exchange_token(auth_string)
    current_user.discogs=discogs.user_hash ###<--makes each attr accessible as .whatever
    current_user.save!
    redirect_to user_path(current_user)

  end

  def search
    # byebug
    discogs=DiscogsService.new
    results=discogs.search(params["discogs_search"], current_user.oauth_token, current_user.oauth_token_secret)
    render json: results
  end

end
