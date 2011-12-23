class EwController < ApplicationController
  def date_index
    @pages = WikiPage.find :all, 
      :select => "#{WikiPage.table_name}.*, #{WikiContent.table_name}.updated_on", 
      :joins => "LEFT JOIN #{WikiContent.table_name} ON #{WikiContent.table_name}.page_id = #{WikiPage.table_name}.id", 
      :order => "#{WikiContent.table_name}.updated_on DESC"
    @pages_by_date = @pages.group_by {|p| p.updated_on.to_date}
    @pages_by_parent_id = @pages.group_by(&:parent_id)

    @pages.first.wiki
  end
end
