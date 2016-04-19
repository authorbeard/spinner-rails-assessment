class AddLastSpunToUserAlbums < ActiveRecord::Migration
  def change
    add_column :user_albums, :last_spun, :datetime
  end
end
