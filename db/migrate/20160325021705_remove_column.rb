class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :songs, :artist_id
  end
end
