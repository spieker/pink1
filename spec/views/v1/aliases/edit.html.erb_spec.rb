require 'rails_helper'

RSpec.describe "v1/aliases/edit", type: :view do
  before(:each) do
    @v1_alias = assign(:v1_alias, V1::Alias.create!())
  end

  it "renders the edit v1_alias form" do
    render

    assert_select "form[action=?][method=?]", v1_alias_path(@v1_alias), "post" do
    end
  end
end
