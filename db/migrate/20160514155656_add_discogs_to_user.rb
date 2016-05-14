class AddDiscogsToUser < ActiveRecord::Migration
  def change
    add_column :users, :discogs, :text
  end
end
