require 'rails_helper'

RSpec.describe Domain, type: :model do

  # relations
  it { should belong_to :company }

  # validations
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).case_insensitive }

end
