class Therapy < ActiveRecord::Base
  belongs_to :patient
  belongs_to :treatment

  def active?
    if self.active == true
      "#{self.patient}'s treatment(#{self.treatment}) is active."
    else
      "#{self.patient}'s treatment(#{self.treatment}) is not active."
    end
  end

end
