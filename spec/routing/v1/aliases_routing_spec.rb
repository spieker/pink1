require "rails_helper"

RSpec.describe V1::AliasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/aliases").to route_to("v1/aliases#index")
    end

    it "routes to #new" do
      expect(:get => "/v1/aliases/new").to route_to("v1/aliases#new")
    end

    it "routes to #show" do
      expect(:get => "/v1/aliases/1").to route_to("v1/aliases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/v1/aliases/1/edit").to route_to("v1/aliases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/v1/aliases").to route_to("v1/aliases#create")
    end

    it "routes to #update" do
      expect(:put => "/v1/aliases/1").to route_to("v1/aliases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/aliases/1").to route_to("v1/aliases#destroy", :id => "1")
    end

  end
end
