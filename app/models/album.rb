class Album < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :artist
  has_many :songs

  accepts_nested_attributes_for :songs
end
