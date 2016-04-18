class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string  "title"
      t.string  "catalog_no"
      t.string  "group"
      t.integer "rel_date"
      t.integer "rel_id"
      t.date    "acquired"
      t.string  "search_q"
      t.string  "alb_url"
      t.integer "artist_id"
      t.timestamps null: false
    end
  end
end
