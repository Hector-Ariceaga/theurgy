class Patient < ActiveRecord::Base
  validates :name, presence: true
  has_many :symptoms
  has_many :diagnoses
  has_many :therapies
  has_many :treatments, through: :therapies
end
