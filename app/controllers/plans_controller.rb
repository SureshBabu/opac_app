class PlansController < ApplicationController
  def index
    @subscriptionplans = Plan.find_all_by_subscription(1)
    @perbookplans = Plan.find_all_by_subscription(0)
    
  end
end
