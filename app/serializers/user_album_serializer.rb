class UserAlbumSerializer < ActiveModel::Serializer
  attributes :spins, :last_spun
  has_many :albums, only: [:id, :name]
  has_one :user
end
