require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create :user }
  let(:domain) { user.company.domains.first }

  # references

  it { should belong_to :company }
  it { should have_many :aliases }

  # validations

  it { should validate_presence_of :company }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_uniqueness_of(:email).case_insensitive }

  context 'email address' do
    it 'is valid with domain name included in companies domains' do
      user.email = 'user@%s'%[domain.name]
      expect(user).to be_valid
    end

    it 'is invalid foreign domain name' do
      user.email = 'user@some.example.com'
      expect(user).not_to be_valid
    end

    it 'is invalid with an invalid email address' do
      user.email = 'user.example.com'
      expect(user).not_to be_valid
    end
  end

  context 'password' do
    it 'is encrypted when set' do
      user.password = 'some password'
      expect(user.password).not_to eql 'some password'
    end

    it 'is CRYPT-SHA512 encrypted' do
      user.password = 'some password'
      salt = user.password[3..18]
      expect(user.password).to eql UnixCrypt::SHA512.build(
        'some password', salt
      )
    end
  end
end
