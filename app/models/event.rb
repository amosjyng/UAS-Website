class Event < ActiveRecord::Base
  attr_accessible :content, :date, :title
  
  validates :title,  :presence => true
  validates :date,   :presence => true
  validates :content,  :presence => true,
                     :length => { :minimum => 5 }
end
