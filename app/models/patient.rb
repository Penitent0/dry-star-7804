class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  def self.over_18
    Patient.where('age > 18').sort
  end
end