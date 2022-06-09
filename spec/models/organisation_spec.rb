require 'rails_helper'

RSpec.describe Organisation, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'has a valid factory' do
    expect(build_stubbed(:organisation)).to be_valid
  end

  describe 'Validations' do
    it 'is invalid without name' do
      expect(build(:organisation, name: nil)).to be_invalid
    end

    it 'is invalid without email' do
      expect(build(:organisation, email: nil)).to be_invalid
    end

    it 'is invalid without contact_number' do
      expect(build(:organisation, contact_number: nil)).to be_invalid
    end

    it 'is invalid without correct format email' do
      expect(build(:organisation, email: 'dummy')).to be_invalid
    end

    it 'is invalid without correct format website' do
      expect(build(:organisation, website: 'dummy')).to be_invalid
    end
  end
end
