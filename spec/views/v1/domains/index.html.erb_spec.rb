require 'rails_helper'

RSpec.describe "v1/domains/index", type: :view do
  before(:each) do
    assign(:v1_domains, [
      V1::Domain.create!(),
      V1::Domain.create!()
    ])
  end

  it "renders a list of v1/domains" do
    render
  end
end
