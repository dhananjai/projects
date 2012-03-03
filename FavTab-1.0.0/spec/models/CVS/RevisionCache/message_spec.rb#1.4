require 'spec_helper'

describe Message do
 before(:each) do
  @message = {:id => 1,
                :sender_id => 1,
                :receiver_id => 2,
                :message => "Hi how ru?",                           
                :deleted_by_sender => 1, 
                :deleted_by_receiver => 1
                }
  end
  
  it "should create a new instance given valid attributes" do
    Message.create!(@message)
  end
  
  it "should require a message" do
    blank_message = Message.new(@message.merge(:message => ""))
    blank_message.should_not be_valid
  end
     
  it "should reject message that are too long" do
    message = "a" * 2001
    long_message = Message.new(@message.merge(:message => message))
    long_message.should_not be_valid
  end
  
 # it "should be validate message" do
 #   message = Message.new(@message.merge(:message => "<td>messgae</td>"))
 #   message.should_not be_valid
 # end
  
  it "should delete the message for the sender/receiver depending on login user delete from sent/inbox messages" do
    @message = Message.create(:sender_id => 1, :receiver_id => 2, :message => "Hi how ru?", :deleted_by_sender => false, :deleted_by_receiver => false )
    @message.delete_message(1)
    Message.find(@message).deleted_by_sender.should be_true
    @message.delete_message(2)
    Message.find(@message).deleted_by_receiver.should be_true
  end

  
end
