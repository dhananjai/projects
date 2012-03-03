class SharedTab < ActiveRecord::Base
  belongs_to :shareable, :polymorphic => true
  belongs_to :group
end
