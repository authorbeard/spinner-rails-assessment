class UserAlbum < ActiveRecord::Base

  belongs_to :user 
  belongs_to :album 

  before_update :last_spun


  protected

  def last_spun
    last_spun=Time.now
  end



end