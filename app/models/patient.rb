class Patient < ActiveRecord::Base
  validates :name, presence: true
  has_many :symptoms
  has_many :diagnoses
  has_many :therapies
  has_many :treatments, through: :therapies
  belongs_to :user
  validates_format_of :dob, :with => /\A\d{2}\/\d{2}\/\d{4}\Z/, :message => "must be in the following format: mm/dd/yyyy"

  def highest_risk_patients
    Patient.joins(:therapies).group("patients.id").having("COUNT(treatment_id) > ?, 2").limit(10)
  end

end
