class DiscogsController < ApplicationController


  def auth
# byebug
    discogs=DiscogsService.new
    auth_hash=discogs.get_token
  # byebug
    token=discogs.auth_hash["oauth_token"]
    secret=discogs.auth_hash["oauth_token_secret"]
    call_conf=discogs.auth_hash["oauth_callback_confirmed"]

    resp = redirect_to("https://discogs.com/oauth/authorize?oauth_token=#{token}")
  end

  def callback

    ### RIGHT NOW, GETING THIS AFTER REDEIRECT ###
    # https://www.discogs.com/%27http://localhost:3000/auth%27?oauth_token=umcXWiKsiKGPouttmAgRTtgXMZCQwLzZsBwTwZFi&oauth_verifier=csUGJskvhc

    byebug

  end


  private
    def discogs_authenticate
      !!session[:discogs_token]      
    end

end
