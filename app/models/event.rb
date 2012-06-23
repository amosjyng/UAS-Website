class Event < ActiveRecord::Base
  attr_accessible :content, :date, :title
  
  validates_presence_of :title, :date, :content
  validates :content, :length => { :minimum => 5 }
end
