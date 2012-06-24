class Event < ActiveRecord::Base
  attr_accessible :content, :date, :title

  validates :title, :date, :content, :presence => true
  validates :content, :length => {:minimum => 5}
end
