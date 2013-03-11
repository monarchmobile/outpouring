class Product < ActiveRecord::Base
  attr_accessible :description, :slug, :title, :piggybak_sellable_attributes

  acts_as_sellable_with_variants
  # acts_as_sellable

end
