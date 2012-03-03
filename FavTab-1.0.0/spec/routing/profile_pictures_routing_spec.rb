require "spec_helper"

describe ProfilePicturesController do
  describe "routing" do

    it "routes to #index" do
      get("/profile_pictures").should route_to("profile_pictures#index")
    end

    it "routes to #new" do
      get("/profile_pictures/new").should route_to("profile_pictures#new")
    end

    it "routes to #show" do
      get("/profile_pictures/1").should route_to("profile_pictures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/profile_pictures/1/edit").should route_to("profile_pictures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/profile_pictures").should route_to("profile_pictures#create")
    end

    it "routes to #update" do
      put("/profile_pictures/1").should route_to("profile_pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/profile_pictures/1").should route_to("profile_pictures#destroy", :id => "1")
    end

  end
end
