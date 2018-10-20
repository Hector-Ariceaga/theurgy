class User < ActiveRecord::Base
  has_secure_password
  validates :name, :username, presence: true
  has_many :patients
end
