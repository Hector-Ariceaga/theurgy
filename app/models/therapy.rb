class Therapy < ActiveRecord::Base
  belongs_to :patient
  belongs_to :treatment
end
