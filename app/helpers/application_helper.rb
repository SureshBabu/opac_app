module ApplicationHelper
  def title
    base_title = "Strata Retail - Just Books Community Library Chain"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end  
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    sortdir = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :sortdir => sortdir, :page => nil), {:class => css_class}
  end
end
