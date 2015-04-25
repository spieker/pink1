require 'rails_helper'

RSpec.describe Alias, type: :model do

  let(:_alias) { FactoryGirl.create :alias }
  let(:domain) { _alias.company.domains.first }

  # relations
  it { should belong_to :user }
  it { should have_one :company }

  # validations
  it { should validate_presence_of :user }
  it { should validate_presence_of :source }
  it { should validate_uniqueness_of(:source).case_insensitive }

  context 'email address' do
    it 'is valid with domain name included in companies domains' do
      _alias.source = 'user@%s'%[domain.name]
      expect(_alias).to be_valid
    end

    it 'is invalid foreign domain name' do
      _alias.source = 'user@some.example.com'
      expect(_alias).not_to be_valid
    end
  end
end
