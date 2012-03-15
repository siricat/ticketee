class Ticket < ActiveRecord::Base

  searcher do
    label :tag, :from => :tags, :field => :name
    label :state, :from => :state, :field => "name"
  end
  
  # can now search like this:
  # tag:name_of_tag, tag:iteration_1
  # state:name_of_state, state:Open
  # can also chain search, tag:css state:Open

  belongs_to :project
  belongs_to :state
  belongs_to :user
  has_many :assets
 # accepts_nested_attributes_for tells the model to accept asset attributes 
 # and ticket attributes whenever methods like new, build or update are called
  accepts_nested_attributes_for :assets
  has_many :comments
  has_and_belongs_to_many :tags
  
  validates :title, :presence  => true
  validates :description, :presence  => true, :length => { :minimum => 10 }
  
  def tag!(tags)
    tags = tags.split(" ").map do |tag|
      Tag.find_or_create_by_name(tag)
    end
    self.tags << tags
  end
  
end
