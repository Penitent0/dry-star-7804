require 'rails_helper'

RSpec.describe Patient, type: :model do
  it {should have_many(:patient_doctors)}
  it {should have_many(:doctors).through(:patient_doctors)}

  describe 'class methods' do
    before :each do
      @hospital_1 = Hospital.create!(name: "Pine Creek Hospital")
      @hospital_2 = Hospital.create!(name: "Sunny Ridge Hospital")
      @hospital_3 = Hospital.create!(name: "Oceanside Hospital")
  
      @doctor_1 = @hospital_1.doctors.create!(name: "George", specialty: "Throat and Nose", university: "UCSB")
      @doctor_2 = @hospital_2.doctors.create!(name: "Susan", specialty: "Surgery", university: "UCLA")
      @doctor_3 = @hospital_3.doctors.create!(name: "Phil", specialty: "Dermatology", university: "HSU")
  
      @patient_1 = Patient.create!(name: "Larry", age: 34)
      @patient_2 = Patient.create!(name: "Mary", age: 24)
      @patient_3 = Patient.create!(name: "Bill", age: 54)
      @patient_4 = Patient.create!(name: "Luke", age: 23)
      @patient_5 = Patient.create!(name: "Sam", age: 65)
      @patient_6 = Patient.create!(name: "Liz", age: 18)
      @patient_7 = Patient.create!(name: "Alice", age: 24)
      @patient_8 = Patient.create!(name: "Gary", age: 67)
      @patient_9 = Patient.create!(name: "Mark", age: 12)
      @patient_10 = Patient.create!(name: "Sally", age: 51)
      @patient_11 = Patient.create!(name: "Mike", age: 11)
      @patient_12 = Patient.create!(name: "Tim", age: 61)
  
      PatientDoctor.create!(doctor: @doctor_1, patient: @patient_1)
      PatientDoctor.create!(doctor: @doctor_1, patient: @patient_2)
      PatientDoctor.create!(doctor: @doctor_1, patient: @patient_3)
      PatientDoctor.create!(doctor: @doctor_1, patient: @patient_4)
  
      PatientDoctor.create!(doctor: @doctor_2, patient: @patient_5)
      PatientDoctor.create!(doctor: @doctor_2, patient: @patient_6)
      PatientDoctor.create!(doctor: @doctor_2, patient: @patient_7)
      PatientDoctor.create!(doctor: @doctor_2, patient: @patient_8)
  
      PatientDoctor.create!(doctor: @doctor_3, patient: @patient_9)
      PatientDoctor.create!(doctor: @doctor_3, patient: @patient_10)
      PatientDoctor.create!(doctor: @doctor_3, patient: @patient_11)
      PatientDoctor.create!(doctor: @doctor_3, patient: @patient_12)
    end

    describe 'over_18 nethod' do
      it 'lists only patients over 18' do
        expect(Patient.over_18).to include(@patient_1, @patient_2, @patient_3, @patient_4, @patient_5, @patient_7, @patient_8, @patient_10, @patient_12)
      end

      it 'does not list patients under 18' do
        expect(Patient.over_18).to_not include(@patient_6, @patient_9, @patient_11)
      end
    end

    describe 'names_alpha' do
      it 'lists patient names in alphabetical order' do
        expect(Patient.names_alpha).to eq([])
      end
    end
  end
end
