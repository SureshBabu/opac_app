class Plan < ActiveRecord::Base
  def signup_amount
    security_deposit + registration_fee + reading_fee + magazine_fee
  end
  def monthly_amount
    reading_fee + magazine_fee
  end
end
