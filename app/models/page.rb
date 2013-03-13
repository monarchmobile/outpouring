class Page < ActiveRecord::Base
  attr_accessible :content, :published, :slug, :title
  before_create :make_slug
  # validates :slug, :uniqueness => true

  

  # pretty url
  extend FriendlyId
  friendly_id :slug

  private
	  def make_slug
	    self.slug = self.title.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
	  end
end
