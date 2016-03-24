class Artist < ActiveRecord::Base
  validates :name, :album, presence: true

  has_many :songs
  belongs_to :album
end
