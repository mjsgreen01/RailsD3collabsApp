class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :title
      t.text :song_link

      t.timestamps
    end
  end
end
