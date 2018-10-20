class Treatment < ActiveRecord::Base
  has_many :therapies
  has_many :patients, through: :therapy
end
