class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  store :discogs, accessors: [:oauth_token, :oauth_token_secret], coder: JSON

  has_many :user_albums
  has_many :albums, through: :user_albums

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name

  end
end

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
    user_albums.find_by(album_id: album.id).increment(:spins, by=1).save
  end

end

