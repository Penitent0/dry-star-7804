require 'rails_helper'

RSpec.describe 'doctor show page' do 
  before :each do
    @doctor_1 = Doctor.new(name: "George", specialty: "Throat and Nose", university: "UCSB")
    @doctor_2 = Doctor.new(name: "Susan", specialty: "Surgery", university: "UCLA")

    @patient_1 = Patient.new(name: "Larry", age: 34)
    @patient_2 = Patient.new(name: "Mary", age: 24)
    @patient_3 = Patient.new(name: "Bill", age: 54)
    @patient_4 = Patient.new(name: "Luke", age: 23)
    @patient_5 = Patient.new(name: "Sam", age: 65)
    @patient_6 = Patient.new(name: "Liz", age: 18)
    @patient_7 = Patient.new(name: "Alice", age: 24)
    @patient_8 = Patient.new(name: "Gary", age: 67)

    PatientDoctor.new(doctor: @doctor_1, patient: @patient_1)
    PatientDoctor.new(doctor: @doctor_1, patient: @patient_2)
    PatientDoctor.new(doctor: @doctor_1, patient: @patient_3)
    PatientDoctor.new(doctor: @doctor_1, patient: @patient_4)

    PatientDoctor.new(doctor: @doctor_2, patient: @patient_5)
    PatientDoctor.new(doctor: @doctor_2, patient: @patient_6)
    PatientDoctor.new(doctor: @doctor_2, patient: @patient_7)
    PatientDoctor.new(doctor: @doctor_2, patient: @patient_8)
  end

  # User Story 1, Doctors Show Page
  # ​
  # As a visitor
  # When I visit a doctor's show page
  # I see all of that doctor's information including:
  #  - name
  #  - specialty
  #  - university where they got their doctorate
  # And I see the name of the hospital where this doctor works
  # And I see the names of all of the patients this doctor has

  describe 'User Story 1, Doctors Show Page' do
    it 'I see all of that doctors information' do
      
    end

    it 'And I see the name of the hospital where this doctor works' do

    end

    it 'And I see the names of all of the patients this doctor has' do
      
    end
  end
end