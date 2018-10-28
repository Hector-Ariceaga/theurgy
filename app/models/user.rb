class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  has_many :patients
end
