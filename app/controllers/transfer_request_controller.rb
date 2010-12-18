class TransferRequestController < ApplicationController
  def index
    @transferRequests = TransferRequest.paginate :page => params[:page], :order => 'created_at DESC'
  end
  
  def update
    @transferRequest = TransferRequest.find(params[:id])
    @transferRequest.assign!
  rescue Transitions::InvalidTransition
    flash[:notice] = 'something'
  end
end
