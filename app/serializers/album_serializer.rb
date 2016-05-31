class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :cover
  has_one :artist, serializer: ArtistAlbumSerializer, only: [:id, :name]
  has_many :songs, serializer: AlbumSongSerializer, only: [:id, :title]
end
