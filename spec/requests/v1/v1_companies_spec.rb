require 'rails_helper'

RSpec.describe "V1::Companies", type: :request do
  describe "GET /v1_companies" do
    it "works! (now write some real specs)" do
      get v1_companies_path
      expect(response).to have_http_status(200)
    end
  end
end
