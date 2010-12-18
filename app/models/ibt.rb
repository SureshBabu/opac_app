class Ibt < ActiveRecord::Base
  include ActiveRecord::Transitions

  acts_as_versioned :table_name => :ibt_versions

  belongs_to :transfer_request
  
  state_machine do
    state :new # first one is the initial state
    state :assigned
    state :declined
    state :fulfilled
    state :dispatched
    state :received
    
    event :assign do
      transitions :to => :assigned, :from => [:new, :declined], :on_transition => :do_assign
    end
    event :decline do
      transitions :to => :declined, :from => [:assigned, :declined], :on_transition => :do_decline
    end
    event :fulfill do
      transitions :to => :fulfilled, :from => :assigned, :on_transition => :do_fulfill
    end
    event :dispatch do
      transitions :to => :dispatched, :from => :fulfilled, :on_transition => :do_dispatch
    end
    event :receive do
      transitions :to => :received, :from => :dispatched, :on_transition => :do_receive
    end
  end
  
  def do_assign
  end
  
  def do_decline
  end
  
  def do_fulfill
  end
  
  def do_dispatch
  end
  
  def do_receive
  end
end
