class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :artists, serializer: AlbumArtistSerializer
end
