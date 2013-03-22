class LinksPages < ActiveRecord::Base
	belongs_to :link
	belongs_to :page
end