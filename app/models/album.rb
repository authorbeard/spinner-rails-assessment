class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :songs
  has_many :fan_albums
  has_many :fans, through: :fan_albums
  has_many :spins

end
