class IbtrsController < ApplicationController
  def index
    @ibts = Ibtr.paginate :page => params[:page], :order => 'created_at DESC'
  end
  
  def update
    @ibtr = Ibtr.find(params[:id])
    @ibtr.processEvent(params[:ibtr][:event])
    @ibtr.update_attributes(:respondent_id => params[:ibtr][:respondent_id], :state => @ibtr.current_state, :title_id => params[:ibtr][:title_id])
    flash[:notice] = "Successfully #{@ibtr.state} " << (params[:ibtr][:event].eql?("assign") ? "to #{@ibtr.respondent_id}!" : "!")
  rescue Transitions::InvalidTransition
    flash[:error] = "Cannot #{params[:ibtr][:event]} a request that is #{@ibtr.state}."
  end  
end
