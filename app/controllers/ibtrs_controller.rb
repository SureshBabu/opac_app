class IbtrsController < ApplicationController
  def index
    @ibts = Ibtr.paginate :page => params[:page], :order => 'created_at, id DESC'
  end
  
  def update
    @ibt = Ibtr.find(params[:id])
    @ibt.assign!
  rescue Transitions::InvalidTransition
    flash[:notice] = 'something'
  end  
end
