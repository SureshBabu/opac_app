class Stockitem < ActiveRecord::Base
  has_one :title
  has_one :publisher
  has_one :author
  has_one :category
  
  validates :title_id, :numericality => true, :presence => true, :uniqueness => true
  validates :author_id, :numericality => true, :presence => true
  validates :category_id, :numericality => true, :presence => true
  validates :publisher_id, :numericality => true, :presence => true
  validates :title_name, :presence => true, :length => { :minimum => 1, :maximum => 100 }
  validates :isbn, :presence => true, :length => { :minimum => 10, :maximum => 16 }
  validates :language, :presence => true, :length => { :minimum => 1, :maximum => 13 }
  validates :edition, :presence => true, :length => { :minimum => 1, :maximum => 13 }
  validates :pubyear, :presence => true, :numericality => true, :length => {:minimum => 4, :maximum => 4}
  validates :pages, :presence => true, :numericality => true, :inclusion => (1..10000)
  
  validates_associated :title
  
  def self.new_for_title(titleId)
    title = Title.find(titleId)
    stockitem = Stockitem.new
    stockitem.title_id = title.id
    stockitem.author_id = title.author_id
    stockitem.category_id = title.category_id
    stockitem.publisher_id = title.publisher_id
    stockitem.title_name = title.title
    stockitem.isbn = title.isbn13
    stockitem.language = title.language
    stockitem.edition = title.edition
    stockitem.pubyear = title.yearofpublication
    stockitem.pages = title.noofpages

    stockitem.author = title.author
    
    stockitem
  end
end
