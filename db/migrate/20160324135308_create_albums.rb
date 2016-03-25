class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.references :artist, index: true
      t.timestamps null: false
    end
  end
end

