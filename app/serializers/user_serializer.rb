class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :user_albums#, only: [:spins, :last_spun]
  has_many :albums
end



