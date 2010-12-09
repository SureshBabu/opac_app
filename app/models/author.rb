class Author < ActiveRecord::Base
  has_many :titles

  attr_accessible :name, :firstname, :middlename, :lastname

  validates :firstname, :presence => true
end
