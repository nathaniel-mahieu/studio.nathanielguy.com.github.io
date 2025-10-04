class Catagory < ActiveRecord::Base
  has_and_belongs_to_many :pictures
  
  validates_presence_of :name
end
