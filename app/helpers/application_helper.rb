module ApplicationHelper

  # def reorder_nav_buttons
  #   pages = Page.where(published: true).select("index, title, updated_at").order("updated_at DESC")
  #   pages_enum = pages.each
  #   pages[0].title
  # end

  def update_list
  		models = ActiveRecord::Base.connection.tables.collect{|t| t.underscore.singularize.camelize}
		models.each do |m|
			if Supermodel.find(:all, conditions: {name: m }).count == 0
				Supermodel.create(name: m)
			end
		end
  end
	
end


