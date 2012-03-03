require "spec_helper"

describe UserDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_details").should route_to("user_details#index")
    end

    it "routes to #new" do
      get("/user_details/new").should route_to("user_details#new")
    end

    it "routes to #show" do
      get("/user_details/1").should route_to("user_details#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_details/1/edit").should route_to("user_details#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_details").should route_to("user_details#create")
    end

    it "routes to #update" do
      put("/user_details/1").should route_to("user_details#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_details/1").should route_to("user_details#destroy", :id => "1")
    end

  end
end
