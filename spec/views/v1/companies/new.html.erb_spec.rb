require 'rails_helper'

RSpec.describe "v1/companies/new", type: :view do
  before(:each) do
    assign(:v1_company, V1::Company.new())
  end

  it "renders new v1_company form" do
    render

    assert_select "form[action=?][method=?]", v1_companies_path, "post" do
    end
  end
end
