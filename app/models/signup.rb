class Signup < ActiveRecord::Base
  
  PAYMENT_MODES = {
    :cash   => 1,
    :check  => 2, 
    :card   => 3
  }  
  
  attr_accessor :check_no, :card_no
  attr_accessible :name, :address, :mphone, :lphone, :email, :referrer_member_id, :employee_no, :plan_id, :branch_id, :signup_months, :payment_mode, :membership_no, :application_no
  
  belongs_to :user, :foreign_key => 'created_by'
  belongs_to :user, :foreign_key => 'modified_by'
  belongs_to :plan
  
  
  validates :name, :presence => true, :length => { :minimum => 2, :maximum => 100 }
  validates :address, :presence => true, :length => { :minimum => 2, :maximum => 100 }
  validates :mphone, :numericality => true, :length => { :minimum => 7, :maximum => 10 }
  validates :lphone, :numericality => true, :length => { :minimum => 7, :maximum => 10 }
  validates :referrer_member_id, :length => { :maximum => 10 }
  validates :employee_no, :length => { :maximum => 10 }
  validates :membership_no, :presence => true, :length => { :maximum => 10 }
  validates :application_no, :presence => true, :length => { :maximum => 10 }
  validates :payment_mode, :presence => true, :numericality => {:greater_than => 0, :less_than => 4 }
  validates :email, :email => true
  
  before_save :set_defaults
  
  private 
  
  def set_defaults
    plan = Plan.find(plan_id)
    
    self.referrer_cust_id = nil

    # these values are possibly allowed to be changed during sign-up
    # dont have time to do this
    self.security_deposit = plan.security_deposit
    self.registration_fee = plan.registration_fee
    self.reading_fee = plan.reading_fee_for_term(self.signup_months)
    self.discount = 0
    self.advance_amt = 0
  end
  
end
