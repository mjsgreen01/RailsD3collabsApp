class ChangePostresDataTypeSongtitle < ActiveRecord::Migration
  def up 
    execute <<-SQL
        ALTER TABLE songs ALTER COLUMN title type text
    SQL
end
end
