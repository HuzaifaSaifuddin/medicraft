require 'rails_helper'

RSpec.describe Patient, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'has a valid factory' do
    expect(build_stubbed(:patient)).to be_valid
  end

  describe 'Validations' do
    it 'is invalid without salutation' do
      expect(build(:patient, salutation: nil)).to be_invalid
    end

    it 'is invalid without first_name' do
      expect(build(:patient, first_name: nil)).to be_invalid
    end

    it 'is invalid without last_name' do
      expect(build(:patient, last_name: nil)).to be_invalid
    end

    it 'is invalid without gender' do
      expect(build(:patient, gender: nil)).to be_invalid
    end

    it 'is invalid without mobile_number' do
      expect(build(:patient, mobile_number: nil)).to be_invalid
    end

    it 'is invalid without display_id' do
      expect(build(:patient, display_id: nil)).to be_invalid
    end

    it 'is invalid without registration_time' do
      expect(build(:patient, registration_time: nil)).to be_invalid
    end

    it 'is invalid without organisation_id' do
      expect(build(:patient, display_id: nil)).to be_invalid
    end

    it 'is invalid if both age_year and age_month are not present' do
      expect(build(:patient, birth_date: nil, age_year: 0, age_month: 0)).to be_invalid
    end

    it 'is valid if either age_year and age_month is present' do
      expect(build(:patient, birth_date: nil, age_year: 1, age_month: 0)).to be_valid

      expect(build(:patient, birth_date: nil, age_year: 0, age_month: 1)).to be_valid
    end

    it 'is invalid without unique display_id' do
      patient = create(:patient)
      expect(build(:patient, display_id: patient.display_id)).to be_invalid
    end

    it 'is invalid if blood_group not from included list' do
      expect(build(:patient, blood_group: 'dummy')).to be_invalid
    end
  end
end
