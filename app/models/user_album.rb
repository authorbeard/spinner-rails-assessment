class UserAlbum < ActiveRecord::Base

  belongs_to :user 
  belongs_to :album 

  before_update :set_last_spun


  # protected

  def set_last_spun
    self.last_spun=Time.now
  end



end