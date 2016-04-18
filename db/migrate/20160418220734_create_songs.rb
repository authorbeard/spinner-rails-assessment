class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :artist
      t.references :album
      t.timestamps null: false
    end
  end
end
