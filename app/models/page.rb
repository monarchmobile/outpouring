class Page < ActiveRecord::Base
  attr_accessible :content, :published, :slug, :title, :index
  before_create :make_slug
  # validates :slug, :uniqueness => true

  has_many :links_pages
  has_many :links, :through => :links_pages
  
  


  # pretty url
  extend FriendlyId
  friendly_id :slug

  # def link?(location)
  #  return !!self.links.find_by_location(location.to_s)
  # end

  def self.s_that_are_published
    where(published: true)
  end

  private
    def make_slug
      self.slug = self.title.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
    end
end
