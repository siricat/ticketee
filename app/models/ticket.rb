class Ticket < ActiveRecord::Base

  belongs_to :project
  belongs_to :user
  has_many :assets
 # accepts_nested_attributes_for tells the model to accept asset attributes 
 # and ticket attributes whenever methods like new, build or update are called
  accepts_nested_attributes_for :assets
  
  validates :title, :presence  => true
  validates :description, :presence  => true, :length => { :minimum => 10 }
  
end
