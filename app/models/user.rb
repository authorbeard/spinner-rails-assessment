class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_albums
  has_many :albums, through: :user_albums
  

  def spins
    user_albums.sum(:spins)
  end

  def last_spin
    Album.find(self.user_albums.order(last_spun: :asc).first.album_id)
  end

end

