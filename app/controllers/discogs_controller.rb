class DiscogsController < ApplicationController


  def start_req
    discogs=DiscogsService.new
    auth_hash=discogs.get_req_token
    token=discogs.auth_hash["oauth_token"]
    # secret=discogs.auth_hash["oauth_token_secret"] ###<--add to discogs secret in exch_token
    # call_conf=discogs.auth_hash["oauth_callback_confirmed"]
# byebug
    redirect_to("https://discogs.com/oauth/authorize?oauth_token=#{token}")
  end

  def callback

    ### GRAB RELEVANT RESPONSE INFO, HAND OFF TO EXCHANGER ###
    # token_params=response.WHUT

    auth_string = response.request.env["REQUEST_URI"]

    #handle callback
    discogs=DiscogsService.new
    discogs.exchange_token(auth_string)
byebug
    current_user.discogs=discogs.user_hash ###<--makes each attr accessible as .whatever
    render plain: testresp

  end


  private
    def discogs_authenticate
      !!session[:discogs_token]      
    end

end
