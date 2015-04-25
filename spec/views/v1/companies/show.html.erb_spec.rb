require 'rails_helper'

RSpec.describe "v1/companies/show", type: :view do
  before(:each) do
    @v1_company = assign(:v1_company, V1::Company.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
