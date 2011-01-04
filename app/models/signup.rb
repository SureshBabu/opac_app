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
  belongs_to :branch
  
  
  validates :name, :presence => true, :length => { :minimum => 2, :maximum => 100 }
  validates :address, :presence => true, :length => { :minimum => 2, :maximum => 100 }
  validates :referrer_member_id, :length => { :maximum => 10 }
  validates :employee_no, :length => { :maximum => 10 }
  validates :membership_no, :presence => true, :uniqueness => true, :length => { :is => 7 }
#  validates :application_no, :presence => true, :uniqueness => true, :length => { :maximum => 10 }
  validates :payment_mode, :presence => true, :numericality => {:greater_than => 0, :less_than => 4 }
  validates :email, :email => true
  validate :payment_ref_should_not_be_blank
  validate :atleast_one_phone_number_required
  
  before_save :set_defaults
  
  
  def payment_ref_should_not_be_blank
    if payment_ref.blank? 
      errors.add(:check_no, "should not be blank") if payment_mode == Signup::PAYMENT_MODES[:check]
      errors.add(:card_no, "should not be blank") if payment_mode == Signup::PAYMENT_MODES[:card]
    end
  end
  
  def atleast_one_phone_number_required
    if mphone.blank? && lphone.blank?
      errors.add(:mphone, "is required")
    end
    unless lphone.blank?
      begin
        errors.add(:lphone, "is more than 10 digits") if lphone.to_s.length > 10
        errors.add(:lphone, "is less than 8 digits") if lphone.to_s.length < 8
      end
    end
    unless mphone.blank?
      begin
        errors.add(:mphone, "should be 10 digits") if mphone.to_s.length != 10
      end
    end
  end
   
  private 
  
  def set_defaults
    plan = Plan.find(plan_id)
    
    self.referrer_cust_id = nil
    self.application_no = '1'

    # these values are possibly allowed to be changed during sign-up
    # dont have time to do this
    self.security_deposit = plan.security_deposit
    self.registration_fee = plan.registration_fee
    self.reading_fee = plan.reading_fee_for_term(self.signup_months)
    self.discount = 0
    self.advance_amt = 0
    self.paid_amt = self.security_deposit + self.registration_fee + self.reading_fee - self.discount + self.advance_amt
    self.overdue_amt = 0
    self.start_date = Date.today
    if plan.subscription
      self.expiry_date = self.start_date.months_since(self.signup_months)
    else
      self.expiry_date = self.start_date.months_since(100)
    end
  end
  
end
