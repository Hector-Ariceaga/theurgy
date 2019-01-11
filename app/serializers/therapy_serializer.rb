class TherapySerializer < ActiveModel::Serializer
  attributes :id, :patient_id, :treatment_id

  belongs_to :patient
  belongs_to :treatment
end
