class Ibtr < ActiveRecord::Base
  include ActiveRecord::Transitions
  
  acts_as_versioned
  
  belongs_to :title
  belongs_to :membership
  
  belongs_to :branch
  belongs_to :respondent, :class_name => 'Branch', :foreign_key => 'respondent_id'

  attr_reader :event
  cattr_reader :per_page
  @@per_page = 10

  state_machine do
    state :New # first one is the initial state
    state :Assigned
    state :Declined
    state :Fulfilled
    state :Dispatched
    state :Received
    state :Cancelled
    
    event :assign do
      transitions :to => :Assigned, :from => [:New, :Declined, :Cancelled]
    end
    event :decline do
      transitions :to => :Declined, :from => :Assigned
    end
    event :fulfill do
      transitions :to => :Fulfilled, :from => :Assigned
    end
    event :dispatch do
      transitions :to => :Dispatched, :from => :Fulfilled
    end
    event :receive do
      transitions :to => :Received, :from => :Dispatched
    end
    event :cancel do
      transitions :to => :Cancelled, :from => [:New, :Assigned, :Declined]
    end
  end
  
  def processEvent(event)
    case 
    when event.eql?('assign') then assign
    when event.eql?('decline') then decline
    when event.eql?('fulfill') then fulfill
    when event.eql?('dispatch') then dispatch
    when event.eql?('receive') then receive
    when event.eql?('cancel') then cancel
    end
  end

  def self.search(params)
    unless (params[:card_id].nil?) then
      paginate :page => params[:page], :conditions => ['card_id = ?', params[:card_id]], :order => 'created_at, id DESC'
    else
      unless (params[:member_id].nil?) then
        paginate :page => params[:page], :conditions => ['member_id = ?', params[:member_id]], :order => 'created_at, id DESC'
      else
        unless (params[:state].nil?) then
          paginate :page => params[:page], :conditions => ['state = ?', params[:state]], :order => 'created_at, id DESC'
        else
          paginate :page => params[:page], :order => 'created_at, id DESC'
        end
      end
    end
  end  
end
