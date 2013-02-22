class Comment < ActiveRecord::Base
  attr_accessible :article_id, :body, :email, :name
  validates_presence_of :body
  belongs_to :article
end
