class Ibtr < ActiveRecord::Base
  include ActiveRecord::Transitions
  
  acts_as_versioned
  
  belongs_to :title
  belongs_to :branch
  belongs_to :membership
  
  attr_accessor :action
  cattr_reader :per_page
  @@per_page = 5
  
  state_machine do
    state :New # first one is the initial state
    state :Assigned
    state :Declined
    state :Fulfilled
    state :Dispatched
    state :Received
    state :Cancelled
    
    event :assign do
      transitions :to => :Assigned, :from => [:New, :Declined], :on_transition => :do_assign
    end
    event :decline do
      transitions :to => :Declined, :from => :Assigned, :on_transition => :do_decline
    end
    event :fulfill do
      transitions :to => :Fulfilled, :from => :Assigned, :on_transition => :do_fulfill
    end
    event :dispatch do
      transitions :to => :Dispatched, :from => :Fulfilled, :on_transition => :do_dispatch
    end
    event :receive do
      transitions :to => :Received, :from => :Dispatched, :on_transition => :do_receive
    end
    event :cancel do
      transitions :to => :Cancelled, :from => [:New, :Declined], :on_transition => :do_cancel
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

  def do_cancel
  end
end
