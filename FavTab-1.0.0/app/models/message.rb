class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_id'
  belongs_to :recipient, :class_name => 'User', :foreign_key => 'receiver_id'
  
  validates :message, :presence => true, :length => {:maximum => 2000}
  validates :receiver_id, :presence => true# {:message => 'Please select the receiver.'}
  #--                                                    
  #Created by: Salil Gaikwad
  #Created on: 07/01/2012
  #Purpose: 
  #++ This method is used to delete the message by sender/receiver
  def delete_message(user_id)
    var = user_id == self.sender_id ? "sender" : "receiver"
    self.update_attribute("deleted_by_#{var}", true)
  end


end
