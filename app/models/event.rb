class Event < ActiveRecord::Base
  attr_accessible :content, :date, :title

  validates :title, :date, :content, :presence => true
  validates :content, :length => {:minimum => 5}

  def summary
    max_length = 300
    if content.length > max_length
      return content[0..max_length] + '...'
    else
      return content
    end
  end
end
