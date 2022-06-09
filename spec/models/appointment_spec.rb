require 'rails_helper'

RSpec.describe Appointment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'has a valid factory' do
    expect(build_stubbed(:appointment)).to be_valid
  end

  describe 'Validations' do
    it 'is invalid without scheduling_date' do
      expect(build(:appointment, scheduling_date: nil)).to be_invalid
    end

    it 'is invalid without scheduling_time' do
      expect(build(:appointment, scheduling_time: nil)).to be_invalid
    end

    it 'is invalid without appointment_date' do
      expect(build(:appointment, appointment_date: nil)).to be_invalid
    end

    it 'is invalid without appointment_time' do
      expect(build(:appointment, appointment_time: nil)).to be_invalid
    end

    it 'is invalid without consultant' do
      expect(build(:appointment, consultant: nil)).to be_invalid
    end

    it 'is invalid without user' do
      expect(build(:appointment, user: nil)).to be_invalid
    end

    it 'is invalid without facility' do
      expect(build(:appointment, facility: nil)).to be_invalid
    end

    it 'is invalid without organisation' do
      expect(build(:appointment, organisation: nil)).to be_invalid
    end
  end
end
