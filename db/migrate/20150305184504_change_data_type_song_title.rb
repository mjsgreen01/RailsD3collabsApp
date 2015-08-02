class ChangeDataTypeSongTitle < ActiveRecord::Migration
  def up
    change_column :songs, :title, :text, :limit => nil
  end

  def down
    change_column :songs, :title, :string
  end
end
