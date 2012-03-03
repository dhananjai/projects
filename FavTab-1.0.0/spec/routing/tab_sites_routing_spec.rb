require "spec_helper"

describe TabSitesController do
  describe "routing" do

    it "routes to #index" do
      get("/tab_sites").should route_to("tab_sites#index")
    end

    it "routes to #new" do
      get("/tab_sites/new").should route_to("tab_sites#new")
    end

    it "routes to #show" do
      get("/tab_sites/1").should route_to("tab_sites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tab_sites/1/edit").should route_to("tab_sites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tab_sites").should route_to("tab_sites#create")
    end

    it "routes to #update" do
      put("/tab_sites/1").should route_to("tab_sites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tab_sites/1").should route_to("tab_sites#destroy", :id => "1")
    end

  end
end
