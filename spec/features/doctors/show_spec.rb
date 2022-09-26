require 'rails_helper'

RSpec.describe 'doctor show page' do
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
      visit doctor_path(@doctor_1)

      within "#doctor-info" do
        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content(@doctor_1.specialty)
        expect(page).to have_content(@doctor_1.university)
        expect(page).to_not have_content(@doctor_3.name)
        expect(page).to_not have_content(@doctor_3.specialty)
        expect(page).to_not have_content(@doctor_3.university)
      end

      visit doctor_path(@doctor_2)

      within "#doctor-info" do
        expect(page).to have_content(@doctor_2.name)
        expect(page).to have_content(@doctor_2.specialty)
        expect(page).to have_content(@doctor_2.university)
        expect(page).to_not have_content(@doctor_1.name)
        expect(page).to_not have_content(@doctor_1.specialty)
        expect(page).to_not have_content(@doctor_1.university)
      end

      visit doctor_path(@doctor_3)

      within "#doctor-info" do
        expect(page).to have_content(@doctor_3.name)
        expect(page).to have_content(@doctor_3.specialty)
        expect(page).to_not have_content(@doctor_2.name)
        expect(page).to_not have_content(@doctor_2.specialty)
      end
    end

    it 'And I see the name of the hospital where this doctor works' do
      visit doctor_path(@doctor_1)

      within "#doctor-hospital-info" do
        expect(page).to have_content(@doctor_1.hospital.name)
        expect(page).to_not have_content(@doctor_2.hospital.name)
        expect(page).to_not have_content(@doctor_3.hospital.name)
      end

      visit doctor_path(@doctor_2)

      within "#doctor-hospital-info" do
        expect(page).to have_content(@doctor_2.hospital.name)
        expect(page).to_not have_content(@doctor_1.hospital.name)
        expect(page).to_not have_content(@doctor_3.hospital.name)
      end

      visit doctor_path(@doctor_3)

      within "#doctor-hospital-info" do
        expect(page).to have_content(@doctor_3.hospital.name)
        expect(page).to_not have_content(@doctor_2.hospital.name)
        expect(page).to_not have_content(@doctor_1.hospital.name)
      end
    end

    it 'And I see the names of all of the patients this doctor has' do
      visit doctor_path(@doctor_1)

      within "#doctor-patient-info" do
        expect(page).to have_content(@patient_1.name)
        expect(page).to have_content(@patient_2.name)
        expect(page).to have_content(@patient_3.name)
        expect(page).to have_content(@patient_4.name)
        expect(page).to_not have_content(@patient_5.name)
        expect(page).to_not have_content(@patient_6.name)
        expect(page).to_not have_content(@patient_7.name)
        expect(page).to_not have_content(@patient_8.name)
      end

      visit doctor_path(@doctor_2)

      within "#doctor-patient-info" do
        expect(page).to have_content(@patient_5.name)
        expect(page).to have_content(@patient_6.name)
        expect(page).to have_content(@patient_7.name)
        expect(page).to have_content(@patient_8.name)
        expect(page).to_not have_content(@patient_9.name)
        expect(page).to_not have_content(@patient_10.name)
        expect(page).to_not have_content(@patient_11.name)
        expect(page).to_not have_content(@patient_12.name)
      end

      visit doctor_path(@doctor_3)

      within "#doctor-patient-info" do
        expect(page).to have_content(@patient_9.name)
        expect(page).to have_content(@patient_10.name)
        expect(page).to have_content(@patient_11.name)
        expect(page).to have_content(@patient_12.name)
        expect(page).to_not have_content(@patient_1.name)
        expect(page).to_not have_content(@patient_2.name)
        expect(page).to_not have_content(@patient_3.name)
        expect(page).to_not have_content(@patient_4.name)
      end
    end
  end

  # User Story 2, Remove a Patient from a Doctor
  # ​
  # As a visitor
  # When I visit a Doctor's show page
  # Next to each patient's name, I see a button to remove that patient from that doctor's caseload
  # When I click that button for one patient
  # I'm brought back to the Doctor's show page
  # And I no longer see that patient's name listed

  describe 'User Story 2, Remove a Patient from a Doctor' do
    it 'When I click that button for one patient Im brought back to the Doctors show page' do
      visit doctor_path(@doctor_1)

      within "#doctor-patient-info" do
        click_on "Remove Patient #{@patient_1.name}"
      end

      expect(current_path).to eq(doctor_path(@doctor_1))

      within "#doctor-patient-info" do
        expect(page).to_not have_content(@patient_1.name)
      end

      visit doctor_path(@doctor_2)

      within "#doctor-patient-info" do
        click_on "Remove Patient #{@patient_5.name}"
      end

      expect(current_path).to eq(doctor_path(@doctor_2))

      within "#doctor-patient-info" do
        expect(page).to_not have_content(@patient_5.name)
      end

      visit doctor_path(@doctor_3)

      within "#doctor-patient-info" do
        click_on "Remove Patient #{@patient_10.name}"
      end

      expect(current_path).to eq(doctor_path(@doctor_3))

      within "#doctor-patient-info" do
        expect(page).to_not have_content(@patient_10.name)
      end
    end
  end
end