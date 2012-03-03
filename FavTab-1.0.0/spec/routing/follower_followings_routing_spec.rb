require "spec_helper"

describe FollowerFollowingsController do
  describe "routing" do

    it "routes to #index" do
      get("/follower_followings").should route_to("follower_followings#index")
    end

    it "routes to #new" do
      get("/follower_followings/new").should route_to("follower_followings#new")
    end

    it "routes to #show" do
      get("/follower_followings/1").should route_to("follower_followings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/follower_followings/1/edit").should route_to("follower_followings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/follower_followings").should route_to("follower_followings#create")
    end

    it "routes to #update" do
      put("/follower_followings/1").should route_to("follower_followings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/follower_followings/1").should route_to("follower_followings#destroy", :id => "1")
    end

  end
end
