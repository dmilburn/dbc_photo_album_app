class User < ActiveRecord::Base
  has_secure_password
  has_many :albums
  validates :password_digest, presence: true
  validates :name, presence: true, uniqueness: :true
end
