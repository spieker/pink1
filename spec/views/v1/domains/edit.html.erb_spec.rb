require 'rails_helper'

RSpec.describe "v1/domains/edit", type: :view do
  before(:each) do
    @v1_domain = assign(:v1_domain, V1::Domain.create!())
  end

  it "renders the edit v1_domain form" do
    render

    assert_select "form[action=?][method=?]", v1_domain_path(@v1_domain), "post" do
    end
  end
end
