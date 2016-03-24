class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.references :album, index: true, null: false

      t.timestamps null: false
    end
  end
end
