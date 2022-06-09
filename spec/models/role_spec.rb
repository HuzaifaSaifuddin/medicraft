require 'rails_helper'

RSpec.describe Role, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'has a valid factory' do
    expect(build_stubbed(:role)).to be_valid
  end

  describe 'Validations' do
    it 'is invalid without name' do
      expect(build(:role, name: nil)).to be_invalid
    end

    it 'is invalid without unique name' do
      create(:role)
      expect(build(:role)).to be_invalid
    end
  end

  describe 'stop_create' do
    it 'doesnt create new roles (apart from the given list)' do
      expect do
        role = build(:role, name: 'newuser')
        role.send(:stop_create)
      end.to raise_error(UncaughtThrowError)
    end
  end

  describe 'stop_destroy' do
    it 'doesnt destroy created role(s)' do
      expect do
        role = build(:role)
        role.send(:stop_destroy)
      end.to raise_error(UncaughtThrowError)
    end
  end
end
