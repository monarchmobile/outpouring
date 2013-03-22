class Page < ActiveRecord::Base
  attr_accessible :content, :published, :slug, :title, :index
  before_create :make_slug
  # validates :slug, :uniqueness => true


  has_many :links, :dependent => :destroy


  # pretty url
  extend FriendlyId
  friendly_id :slug

  def self.s_that_are_published
    where(:published => true).order("index ASC")
  end

  private
	  def make_slug
	    self.slug = self.title.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
	  end
end
