require 'rails_helper'

RSpec.describe "V1::Aliases", type: :request do
  describe "GET /v1_aliases" do
    it "works! (now write some real specs)" do
      get v1_aliases_path
      expect(response).to have_http_status(200)
    end
  end
end
