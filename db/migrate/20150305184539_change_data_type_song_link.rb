class ChangeDataTypeSongLink < ActiveRecord::Migration
  def up
    change_column :songs, :song_link, :text, :limit => nil
  end

  def down
    change_column :songs, :song_link, :string
  end
end
