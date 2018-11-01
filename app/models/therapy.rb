class Therapy < ActiveRecord::Base
  belongs_to :patient
  belongs_to :treatment

  def active?
    if !!self.active
      "#{self.patient.name}'s treatment(#{self.treatment.name}) is active."
    else
      "#{self.patient.name}'s treatment(#{self.treatment.name}) is not active."
    end
  end

end
