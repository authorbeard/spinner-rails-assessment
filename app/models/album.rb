class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :songs
  has_many :user_albums
  has_many :fans, through: :user_albums, source: :user_id

  def artist_name
    artist.name
  end

  def spin_it

  end

  def spins
    user_albums.sum(:spins)
  end


end
