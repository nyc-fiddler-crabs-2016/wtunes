class Artist < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user
  has_many :albums
  has_many :songs

  accepts_nested_attributes_for :albums, :songs
end
