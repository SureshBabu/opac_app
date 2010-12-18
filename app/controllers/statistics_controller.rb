class StatisticsController < ApplicationController
  def view
    @stock = Stock.find_all_by_title_id(params[:title_id].to_i)
  end
end
