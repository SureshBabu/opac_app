class Title < ActiveRecord::Base
  belongs_to :publisher
  belongs_to :author
  belongs_to :category
  
  attr_accessible :title, :yearofpublication, :edition, :isbn10, :isbn13, :noofpages, :language 
  
  validates :title, :presence => true
  
  searchable do
    text :title, :stored => true, :more_like_this => true
    text :author, :stored => true, :more_like_this => true do
      author.name
    end
    text :category, :stored => true, :more_like_this => true do
      category.name
    end
    text :publisher, :stored => true, :more_like_this => true do
      publisher.name
    end
    integer :id, :stored => true
    integer :category_id, :references => Category, :stored => true
    integer :publisher_id, :references => Publisher, :stored => true
    integer :author_id, :references => Author, :stored => true
  end  
end
