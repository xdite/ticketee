class Project < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :tickets


  validates_presence_of :name

end
