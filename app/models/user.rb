class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_albums
  has_many :albums, through: :user_albums

  

  def spins(album)
    user_albums.where(album_id: album.id).sum(:spins)
  end

  def last_spin(album)
    user_albums.where(album_id: album.id).try(:last_spun)
  end

  def last_album
    Album.find(self.user_albums.order(last_spun: :desc).first.album_id)
  end

  def spin_it(album)
    user_albums.find_by(a.id).increment(:spins, by=1)
  end

end

