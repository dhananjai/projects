require "spec_helper"

describe UserDiscussionsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_discussions").should route_to("user_discussions#index")
    end

    it "routes to #new" do
      get("/user_discussions/new").should route_to("user_discussions#new")
    end

    it "routes to #show" do
      get("/user_discussions/1").should route_to("user_discussions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_discussions/1/edit").should route_to("user_discussions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_discussions").should route_to("user_discussions#create")
    end

    it "routes to #update" do
      put("/user_discussions/1").should route_to("user_discussions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_discussions/1").should route_to("user_discussions#destroy", :id => "1")
    end

  end
end
