class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :artist, serializer: ArtistAlbumSerializer
end
