require 'rails_helper'

RSpec.describe 'hospital show page' do 
  before :each do
    @hospital_1 = Hospital.create!(name: "Pine Creek Hospital")
    @hospital_2 = Hospital.create!(name: "Sunny Ridge Hospital")

    @doctor_1 = @hospital_1.doctors.create!(name: "George", specialty: "Throat and Nose", university: "UCSB")
    @doctor_2 = @hospital_1.doctors.create!(name: "Susan", specialty: "Surgery", university: "UCLA")
    @doctor_3 = @hospital_1.doctors.create!(name: "Phil", specialty: "Dermatology", university: "HSU")

    @doctor_4 = @hospital_2.doctors.create!(name: "Steve", specialty: "Surgery", university: "Stanford")
    @doctor_5 = @hospital_2.doctors.create!(name: "Kenneth", specialty: "Attending", university: "Johns Hopkins")
    @doctor_6 = @hospital_2.doctors.create!(name: "Ryan", specialty: "General", university: "Harvard")

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
    @patient_13 = Patient.create!(name: "Gus", age: 12)
    @patient_14 = Patient.create!(name: "Leroy", age: 51)
    @patient_15 = Patient.create!(name: "Harold", age: 11)
    @patient_16 = Patient.create!(name: "Albert", age: 61)

    PatientDoctor.create!(doctor: @doctor_2, patient: @patient_1)
    PatientDoctor.create!(doctor: @doctor_2, patient: @patient_2)
    PatientDoctor.create!(doctor: @doctor_2, patient: @patient_3)
    PatientDoctor.create!(doctor: @doctor_1, patient: @patient_4)

    PatientDoctor.create!(doctor: @doctor_2, patient: @patient_5)
    PatientDoctor.create!(doctor: @doctor_2, patient: @patient_6)
    PatientDoctor.create!(doctor: @doctor_2, patient: @patient_7)
    PatientDoctor.create!(doctor: @doctor_2, patient: @patient_8)

    PatientDoctor.create!(doctor: @doctor_3, patient: @patient_9)
    PatientDoctor.create!(doctor: @doctor_3, patient: @patient_10)
    PatientDoctor.create!(doctor: @doctor_4, patient: @patient_11)
    PatientDoctor.create!(doctor: @doctor_4, patient: @patient_12)

    PatientDoctor.create!(doctor: @doctor_4, patient: @patient_13)
    PatientDoctor.create!(doctor: @doctor_5, patient: @patient_14)
    PatientDoctor.create!(doctor: @doctor_6, patient: @patient_15)
    PatientDoctor.create!(doctor: @doctor_6, patient: @patient_16)
  end

  # Extension, Hospital Show Page
  # ​
  # As a visitor
  # When I visit a hospital's show page
  # I see the hospital's name
  # And I see the names of all doctors that work at this hospital,
  # And next to each doctor I see the number of patients associated with the doctor,
  # And I see the list of doctors is ordered from most number of patients to least number of patients
  # (Doctor patient counts should be a single query)

  describe 'Extension, Hospital Show Page' do
    it 'And I see the names of all doctors that work at this hospital' do
      visit hospital_path(@hospital_1)

      within "#doctor-info" do
        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content(@doctor_2.name)
        expect(page).to have_content(@doctor_3.name)
        expect(page).to_not have_content(@doctor_4.name)
        expect(page).to_not have_content(@doctor_5.name)
        expect(page).to_not have_content(@doctor_6.name)
      end

      visit hospital_path(@hospital_2)

      within "#doctor-info" do
        expect(page).to have_content(@doctor_4.name)
        expect(page).to have_content(@doctor_5.name)
        expect(page).to have_content(@doctor_6.name)
        expect(page).to_not have_content(@doctor_1.name)
        expect(page).to_not have_content(@doctor_2.name)
        expect(page).to_not have_content(@doctor_3.name)
      end
    end

    it 'And next to each doctor I see the number of patients associated with the doctor' do
      visit hospital_path(@hospital_1)

      within "##{@doctor_1.name}-patient-info" do
        expect(page).to have_content(@doctor_1.patients.count)
      end

      visit hospital_path(@hospital_1)

      within "##{@doctor_2.name}-patient-info" do
        expect(page).to have_content(@doctor_2.patients.count)
      end

      visit hospital_path(@hospital_1)

      within "##{@doctor_3.name}-patient-info" do
        expect(page).to have_content(@doctor_3.patients.count)
      end

      visit hospital_path(@hospital_2)

      within "##{@doctor_4.name}-patient-info" do
        expect(page).to have_content(@doctor_4.patients.count)
      end

      visit hospital_path(@hospital_2)

      within "##{@doctor_5.name}-patient-info" do
        expect(page).to have_content(@doctor_5.patients.count)
      end

      visit hospital_path(@hospital_2)

      within "##{@doctor_6.name}-patient-info" do
        expect(page).to have_content(@doctor_6.patients.count)
      end
    end

    it 'And I see the list of doctors is ordered from most number of patients to least number of patients' do
      visit hospital_path(@hospital_1)

      within "#doctor-info" do
        expect(@doctor_2.name).to appear_before(@doctor_3.name)
        expect(@doctor_3.name).to appear_before(@doctor_1.name)
        expect(@doctor_1.name).to_not appear_before(@doctor_2.name)
      end

      visit hospital_path(@hospital_2)

      within "#doctor-info" do
        expect(@doctor_4.name).to appear_before(@doctor_6.name)
        expect(@doctor_6.name).to appear_before(@doctor_5.name)
        expect(@doctor_5.name).to_not appear_before(@doctor_4.name)
      end
    end
  end
end