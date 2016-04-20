class UserAlbum < ActiveRecord::Base

  belongs_to :user 
  belongs_to :album 

  validates :album_id, uniqueness: { scope: :user_id,
    message: "You got that one already." }
  before_update :set_last_spun



  def set_last_spun
    self.last_spun=Time.now
  end



end