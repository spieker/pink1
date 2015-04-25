require 'rails_helper'

RSpec.describe "v1/domains/show", type: :view do
  before(:each) do
    @v1_domain = assign(:v1_domain, V1::Domain.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
