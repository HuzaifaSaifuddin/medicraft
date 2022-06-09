require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'has a valid factory' do
    expect(build_stubbed(:user)).to be_valid
  end

  describe 'Validations' do
    it 'is invalid without a salutation' do
      expect(build(:user, salutation: nil)).to be_invalid
    end

    it 'is invalid without a first_name' do
      expect(build(:user, first_name: nil)).to be_invalid
    end

    it 'is invalid without a last_name' do
      expect(build(:user, last_name: nil)).to be_invalid
    end

    it 'is invalid without a gender' do
      expect(build(:user, gender: nil)).to be_invalid
    end

    it 'is invalid without a birth_date' do
      expect(build(:user, birth_date: nil)).to be_invalid
    end

    it 'is invalid without a mobile_number' do
      expect(build(:user, mobile_number: nil)).to be_invalid
    end

    it 'is invalid without a email' do
      expect(build(:user, email: nil)).to be_invalid
    end

    it 'is invalid without a password' do
      expect(build(:user, password: nil)).to be_invalid
    end

    it 'is invalid without correct format email' do
      expect(build(:user, email: 'dummy')).to be_invalid
    end

    it 'is invalid without correct format password' do
      expect(build(:user, password: 'dummy')).to be_invalid
    end

    it 'is invalid without correct format mobile_number' do
      expect(build(:user, mobile_number: 'dummy')).to be_invalid
    end
  end

  describe 'encrypt_password' do
    it 'encrypts password when password provided' do
      user = build(:user)
      user.send(:encrypt_password)

      expect(user.salt).not_to eq(nil)
      expect(user.encrypted_password).not_to eq(nil)
    end

    it 'doesnt encrypts password when password is nil' do
      user = build(:user, password: nil)
      user.send(:encrypt_password)

      expect(user.salt).to eq(nil)
      expect(user.encrypted_password).to eq(nil)
    end
  end
end
