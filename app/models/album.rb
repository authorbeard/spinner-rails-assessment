class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :songs
  has_many :user_albums
  has_many :fans, through: :user_albums, :source=>:user

  accepts_nested_attributes_for :artist, reject_if: :empty?
  accepts_nested_attributes_for :songs, reject_if: :blank?

  def empty?
    attributes["name"].blank?
  end
  
  def artist_attribues=(attributes)
    self.artist=Artist.find_or_create_by(name: attributes["name"].strip.capitalize)
  end

  def song_attributes=(attributes)
    title=attributes["title"].strip.capitalize
    self.songs.find_or_create_by(title: title, artist: self.artist)
  end

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
