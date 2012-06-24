class Event < ActiveRecord::Base
  attr_accessible :content, :time, :title, :date

  validates :title, :date, :content, :presence => true
  validates :content, :length => {:minimum => 5}

  def date
    if time.nil?
      return Time.now.strftime('%m/%d/%Y')
    else
      Time.at(time).strftime('%m/%d/%Y')
    end
  end

  def date=(day)
    current_time = Time.at(0).to_datetime
    unless time.nil?
      current_time = Time.at(time).to_datetime
    end
    d = Date.strptime(day, '%m/%d/%Y')
    self.time = DateTime.new(d.year, d.month, d.day, current_time.hour,
                             current_time.min, current_time.sec,
                             current_time.zone).to_time.to_i
  end

  def summary
    max_length = 300
    if content.length > max_length
      return content[0..max_length] + '...'
    else
      return content
    end
  end

  def human_time
    Time.at(time).strftime('%A, %B %e at %l:%M %p')
  end
end
