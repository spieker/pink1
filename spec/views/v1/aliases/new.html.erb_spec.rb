require 'rails_helper'

RSpec.describe "v1/aliases/new", type: :view do
  before(:each) do
    assign(:v1_alias, V1::Alias.new())
  end

  it "renders new v1_alias form" do
    render

    assert_select "form[action=?][method=?]", v1_aliases_path, "post" do
    end
  end
end
