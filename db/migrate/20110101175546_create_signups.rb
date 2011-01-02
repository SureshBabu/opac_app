class CreateSignups < ActiveRecord::Migration
  def self.up
    create_table :signups do |t|

      t.string  :name, :null => false
      t.string  :address, :null => false
      t.integer :mphone
      t.integer :lphone
      t.string  :email, :null => false
      t.string  :referrer_member_id
      t.integer :referrer_cust_id
      t.references :plan, :null => false

      t.references :branch
      
      t.integer :signup_months, :null => false
      
      t.float :security_deposit, :null => false
      t.float :registration_fee, :null => false
      t.float :reading_fee, :null => false
      t.float :discount, :null => false
      t.float :advance_amt, :null => false
      
      t.integer :payment_mode, :null => false
      t.string :payment_ref, :null => false
      
      t.string :membership_no
      t.string :application_no
      
      t.string :employee_no

      t.integer :created_by, :null => false
      t.integer :modified_by, :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :signups
  end
end
