require 'rails_helper'

RSpec.describe "v1/aliases/index", type: :view do
  before(:each) do
    assign(:v1_aliases, [
      V1::Alias.create!(),
      V1::Alias.create!()
    ])
  end

  it "renders a list of v1/aliases" do
    render
  end
end
