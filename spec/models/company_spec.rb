require 'rails_helper'

RSpec.describe Company, type: :model do

  # relations
  it { should have_many :domains }
  it { should have_many :users }

  # validations
  it { should validate_presence_of :name }

end
