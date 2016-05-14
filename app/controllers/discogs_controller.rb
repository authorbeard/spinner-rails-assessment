class DiscogsController < ApplicationController


  def auth

    discogs=DiscogsService.new
  byebug
    token_hash = discogs.get_token
    token=token_hash["oauth_token"]
    secret=token_hash["oauth_token_secret"]
    call_conf=token_hash["oauth_callback_confirmed"]

    redirect_to "https://discogs.com/oauth/authorize?oauth_token=token"
  end

  def callback

    byebug

  end


  private
    def discogs_authenticate
      !!session[:discogs_token]      
    end

end
