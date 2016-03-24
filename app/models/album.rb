class Album < ActiveRecord::Base
  validates :title, :user, presence: true

  belongs_to :user
  has_many :artists
  has_many :songs
end
