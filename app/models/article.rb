class Article < ActiveRecord::Base
  attr_accessible :body, :title, :tag_names, :featured, :published, :schedule_in, :schedule_out

  	validates_presence_of :title, :body
	validates_uniqueness_of :title
	has_many :comments, :dependent => :destroy
	has_many :taggings, :dependent => :destroy
	has_many :tags, :through => :taggings
	attr_writer :tag_names
	after_save :assign_tags

	
	scope :featured, where(:featured => true)

	def tag_names
		@tag_names || tags.map(&:name).join('')
	end

	def self.is_featured_article?
		where(featured: true)
	end

	def self.is_published?
		"published" if true
		"draft" if false
	end

	private

	def assign_tags
		if @tag_names
			self.tags = @tag_names.split(/\,/).map do |name|
				Tag.find_or_create_by_name(name)
			end
		end
	end		
end
