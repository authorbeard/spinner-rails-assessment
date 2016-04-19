class StaticController < ApplicationController
  

  def home
    set_user
    @albums=Album.limit(10)
  end
end
