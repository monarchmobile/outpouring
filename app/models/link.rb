class Link < ActiveRecord::Base
  attr_accessible :location
 
  has_many :links_pages
  has_many :pages, :through => :links_pages

  

end
