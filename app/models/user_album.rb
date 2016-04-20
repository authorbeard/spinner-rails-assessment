class UserAlbum < ActiveRecord::Base

  belongs_to :user 
  belongs_to :album 

  validates :album_id, uniqueness: { scope: :user_id,
    message: "You got that one already." }
  before_update :set_last_spun



  def set_last_spun
    self.last_spun=Time.now
  end

  def self.albums_with_fans
    select(:album_id).distinct.pluck(:album_id)
  end

  def self.raw_rankings
    group(:album_id).count.sort_by{|k, v| v}.reverse!
  end

end
