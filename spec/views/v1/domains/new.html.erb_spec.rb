require 'rails_helper'

RSpec.describe "v1/domains/new", type: :view do
  before(:each) do
    assign(:v1_domain, V1::Domain.new())
  end

  it "renders new v1_domain form" do
    render

    assert_select "form[action=?][method=?]", v1_domains_path, "post" do
    end
  end
end
