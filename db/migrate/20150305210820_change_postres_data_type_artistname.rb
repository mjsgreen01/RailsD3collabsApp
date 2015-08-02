class ChangePostresDataTypeArtistname < ActiveRecord::Migration
  def up
    change_column :artists, :name, :text, :limit => nil
  end

  def down
    change_column :artists, :name, :string
  end
end
