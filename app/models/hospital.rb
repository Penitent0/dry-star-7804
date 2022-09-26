class Hospital < ApplicationRecord
  has_many :doctors

  def patient_count_desc
    doctors.joins(:patients)
    .group('doctors.id')
    .select('doctors.*, count(patients.id) as count')
    .order('count desc')
  end
end
