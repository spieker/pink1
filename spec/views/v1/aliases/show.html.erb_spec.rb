require 'rails_helper'

RSpec.describe "v1/aliases/show", type: :view do
  before(:each) do
    @v1_alias = assign(:v1_alias, V1::Alias.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
