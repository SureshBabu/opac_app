class SignupsController < ApplicationController
  def new
    @signUpMonths = 1
    @plan = Plan.find(params[:plan_id])
    @signUpMonths = params[:signUpMonths].to_i unless params[:signUpMonths].empty?
    
    if @signUpMonths < 1 && @plan.subscription
      redirect_to :plans
    end
    
    @signup = Signup.new
    @signup.plan_id = @plan.id
    @signup.signup_months = @signUpMonths
    
#  rescue
#    redirect_to :plans
  end
  
  def create
    @signup = Signup.new(params[:signup])
    if @signup.save
      redirect_to(@signup, :notice => 'SignUp was successfully created')
    else
      render :action => 'new'
    end    
  end
  
  def show
    @signup = Signup.find(params[:id])
  end
end
