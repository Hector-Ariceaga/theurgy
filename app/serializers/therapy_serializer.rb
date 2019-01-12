class TherapySerializer < ActiveModel::Serializer
  attributes :id, :patient_id, :treatment_id, :active

  belongs_to :patient
  belongs_to :treatment

  def patient_name
    {patient_name: self.object.patient.name}
  end

  def treatment_name
    {treatment_name: self.object.treatment.name}
  end
end
