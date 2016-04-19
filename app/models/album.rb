class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :songs
  has_many :user_albums
  has_many :fans, through: :user_albums, :source=>:user

  def artist_name
    artist.name
  end

  def spins
    user_albums.sum(:spins)
  end

  def last_user
    user_albums.order(last_spun: :desc).first.user_id
  end

  def last_spun
    user_albums.order(last_spun: :desc).first.try(:last_spun)
  end


end
