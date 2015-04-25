require "rails_helper"

RSpec.describe V1::DomainsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/domains").to route_to("v1/domains#index")
    end

    it "routes to #new" do
      expect(:get => "/v1/domains/new").to route_to("v1/domains#new")
    end

    it "routes to #show" do
      expect(:get => "/v1/domains/1").to route_to("v1/domains#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/v1/domains/1/edit").to route_to("v1/domains#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/v1/domains").to route_to("v1/domains#create")
    end

    it "routes to #update" do
      expect(:put => "/v1/domains/1").to route_to("v1/domains#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/domains/1").to route_to("v1/domains#destroy", :id => "1")
    end

  end
end
