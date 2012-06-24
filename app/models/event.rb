class Event < ActiveRecord::Base
  attr_accessible :content, :time, :title

  validates :title, :time, :content, :presence => true
  validates :content, :length => {:minimum => 5}

  def summary
    max_length = 300
    if content.length > max_length
      return content[0..max_length] + '...'
    else
      return content
    end
  end

  def human_time
    return Time.at(time).strftime('%A, %B %e at %l:%M %p')
  end
end
