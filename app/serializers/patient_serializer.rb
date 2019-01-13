class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :dob

  belongs_to :user
  has_many :symptoms
  has_many :diagnoses
  has_many :therapies
end
