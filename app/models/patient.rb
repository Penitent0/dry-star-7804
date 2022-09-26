class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  def self.over_18_names_alpha_asc
    Patient.where('age > 18').order(name: :asc)
  end
end