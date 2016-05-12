class UserAlbumSerializer < ActiveModel::Serializer
  attributes :id, :spins, :last_spun
  has_one :album, serializer: AlbumSerializer
end
