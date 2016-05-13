class ChangeSongsIndextoBelongsTo < ActiveRecord::Migration
  def up
    remove_column :songs, :album_id
    change_table :songs do |t|
      t.belongs_to :album, index: true
    end

  end

  def down
    remove_column :songs, :belongs_to
    add_column :songs, :album_id, :integer
    add_index :songs, :album_id
  end
end
