require "spec_helper"

describe TabsController do
  describe "routing" do

    it "routes to #index" do
      get("/tabs").should route_to("tabs#index")
    end

    it "routes to #new" do
      get("/tabs/new").should route_to("tabs#new")
    end

    it "routes to #show" do
      get("/tabs/1").should route_to("tabs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tabs/1/edit").should route_to("tabs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tabs").should route_to("tabs#create")
    end

    it "routes to #update" do
      put("/tabs/1").should route_to("tabs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tabs/1").should route_to("tabs#destroy", :id => "1")
    end

  end
end
