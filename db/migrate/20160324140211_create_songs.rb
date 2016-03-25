class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.references :artist, index: true, null: false
      t.references :album, index: true, null: false
      t.timestamps null: false
    end
  end
end
