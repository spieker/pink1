require 'rails_helper'

RSpec.describe "v1/companies/index", type: :view do
  before(:each) do
    assign(:v1_companies, [
      V1::Company.create!(),
      V1::Company.create!()
    ])
  end

  it "renders a list of v1/companies" do
    render
  end
end
