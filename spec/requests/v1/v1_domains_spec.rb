require 'rails_helper'

RSpec.describe "V1::Domains", type: :request do
  describe "GET /v1_domains" do
    it "works! (now write some real specs)" do
      get v1_domains_path
      expect(response).to have_http_status(200)
    end
  end
end
