class Event < ActiveRecord::Base
  attr_accessible :content, :date, :title

  validates :title, :date, :content, :presence => true
  validates :content, :length => {:minimum => 5}

  def summary
    if content.length > 100
      return content[0..300] + '...'
    else
      return content
    end
  end
end
