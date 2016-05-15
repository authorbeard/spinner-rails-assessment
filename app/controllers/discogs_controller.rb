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
# byebug
    current_user.discogs=discogs.user_hash ###<--makes each attr accessible as .whatever
    current_user.save!
    redirect_to user_path(current_user)

  end

  def search
# byebug
    # redirect_to collection_path(current_user), :alert=>"C'mon, buddy, gimme something to work with" unless !params["discogs_search"]["query"].empty? 

# byebug
    discogs=DiscogsService.new
    results=discogs.search(params["discogs_search"], current_user.oauth_token, current_user.oauth_token_secret)
byebug
    render json: results


  end



  private
    # def discogs_authenticate
    #   !!session[:discogs_token]      
    # end

    # def default_url_options 
    #   {Authorization: current_user.discogs}
    # end

end
