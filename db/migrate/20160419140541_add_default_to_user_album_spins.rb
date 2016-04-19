class AddDefaultToUserAlbumSpins < ActiveRecord::Migration
  def change
    change_column_default :user_albums, :spins, 0
  end
end
