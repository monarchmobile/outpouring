class Product < ActiveRecord::Base
  attr_accessible :description, :slug, :title, :piggybak_sellable_attributes

  accepts_nested_attributes_for :piggybak_sellable
  
  acts_as_sellable_with_variants
  # acts_as_sellable

end
