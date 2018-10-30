class Patient < ActiveRecord::Base
  validates :name, presence: true
  has_many :symptoms
  has_many :diagnoses
  has_many :therapies
  has_many :treatments, through: :therapies
  belongs_to :user

  def highest_risk_patients
    Patient.joins(:therapies).group("patients.id").having("COUNT(treatment_id) > ?, 2").limit(10)
  end

end
