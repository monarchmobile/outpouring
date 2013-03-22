class Link < ActiveRecord::Base
  attr_accessible :no_link, :side_link, :top_link

  belongs_to :page
end
