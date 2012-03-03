require 'spec_helper'

describe Comment do
  before(:each) do
    @comment = Comment.new(:comment => 'Some Comment', :user_id => 1, :discussion_id => 1)
  end

  it "should be invalid without a comment" do
    @comment.comment = nil
    @comment.should_not be_valid
    @comment.errors[:comment].should include("can't be blank.")
    @comment.comment = "Some Comment"
    @comment.should be_valid
  end

  it "should be invalid with a comment more than 1000" do
    @comment.comment = "a"*1001
    @comment.should_not be_valid
    @comment.errors[:comment].should include("is too long (maximum is 1000 characters)")
    @comment.comment = "a"*1000
    @comment.should be_valid
  end

  it "find the total votes for the comment" do
    @comment = Comment.create(:comment => 'Some Comment', :user_id => 1, :discussion_id => 1)
    @rate_two = Rate.create(:score => 3)
    Rating.create(:rate_id => @rate_two.id, :rateable_id => @comment.id, :rateable_type => 'Comment', :user_id => 2)
    Rating.create(:rate_id => @rate_two.id, :rateable_id => @comment.id, :rateable_type => 'Comment', :user_id => 3) 
    @comment.votes.should eql(2)
  end

end
