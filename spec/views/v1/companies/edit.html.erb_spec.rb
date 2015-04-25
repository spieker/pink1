require 'rails_helper'

RSpec.describe "v1/companies/edit", type: :view do
  before(:each) do
    @v1_company = assign(:v1_company, V1::Company.create!())
  end

  it "renders the edit v1_company form" do
    render

    assert_select "form[action=?][method=?]", v1_company_path(@v1_company), "post" do
    end
  end
end
