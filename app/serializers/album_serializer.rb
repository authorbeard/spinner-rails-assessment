class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :artist, serializer: ArtistAlbumSerializer, only: [:name]
  has_many :songs, serializer: AlbumSongSerializer, only: [:id, :title]
end
