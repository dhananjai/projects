require 'spec_helper'

describe "ProfilePictures" do
  describe "GET /profile_pictures" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get profile_pictures_path
      response.status.should be(200)
    end
  end
end
