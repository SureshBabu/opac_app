class StockitemsController < ApplicationController
  def index
    @stockitems = Stockitem.find_all_by_title_id(params[:title_id])
  end
  
  def new
    @stockitem = Stockitem.new_for_title(params[:title_id])
  end
  
  def create      
    @stockitem = Stockitem.new(params[:stockitem])
    if @stockitem.save
      redirect_to(@stockitem, :notice => 'Stockitem was successfully created')
    else
      @stockitem.author = Author.find(params[:stockitem][:author_id])
      render :action => 'new'
    end
  end
  
  def show
    @stockitem = Stockitem.find(params[:id])
  end
  
  def update
    @stockitem = Stockitem.find(params[:id])
    @stockitem.update_attributes(params[:book])
  end
end
