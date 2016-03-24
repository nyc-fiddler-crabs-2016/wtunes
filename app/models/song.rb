class Song < ActiveRecord::Base
  validates :name, :album_id, presence: true

  belongs_to :artist
  belongs_to :album
end
