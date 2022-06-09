require 'rails_helper'

RSpec.describe Facility, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'has a valid factory' do
    expect(build_stubbed(:facility)).to be_valid
  end

  describe 'Validations' do
    it 'is invalid without a name' do
      expect(build(:facility, name: nil)).to be_invalid
    end

    it 'is invalid without a email' do
      expect(build(:facility, email: nil)).to be_invalid
    end

    it 'is invalid without a contact_number' do
      expect(build(:facility, contact_number: nil)).to be_invalid
    end

    it 'is invalid without correct format email' do
      expect(build(:facility, email: 'dummy')).to be_invalid
    end

    it 'is invalid without correct format contact_number' do
      expect(build(:facility, contact_number: 'dummy')).to be_invalid
    end
  end
end
