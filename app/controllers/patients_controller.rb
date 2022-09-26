class PatientsController < ApplicationController
  def destroy
    patient = Patient.find(params[:id])
    doctor = patient.doctors.first
    doctor.patients.delete(patient)
    redirect_to doctor_path(doctor)
  end

  def index
    @patients = Patient.all
  end
end