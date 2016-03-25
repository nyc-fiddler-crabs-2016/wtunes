class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many :artists

  has_secure_password
end
