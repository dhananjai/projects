require 'spec_helper'

describe Group do

  before(:each) do
    @group = Group.new(:name=>'My group', :user_id => 1)
  end

  it "should be invalid without a name" do
    @group.name = ''
    @group.should_not be_valid
  end
  it "should be invalid with name having more than 50 characters" do
    @group.name = 'x'*51
    @group.should_not be_valid
  end
  it "should be invalid with existing name " do
    Group.create(:name=>"My group",:user_id=>1)
    @group.should_not be_valid
  end

  it "should return true if default group" do
    @d_group = Group.create(:name=>"Default",:user_id=>1)
    @d_group.is_default_group?.should be_true
  end
  
end
