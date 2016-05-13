class AddIndexAlbumIdToSongs < ActiveRecord::Migration
  def change
    add_index :songs, :album_id
  end
end
