class Event < ActiveRecord::Base
  attr_accessible :content, :time, :title, :date, :day_time

  validates :title, :date, :day_time, :content, :presence => true
  validates :content, :length => {:minimum => 5}
  validate :date_valid
  validate :time_valid

  def date
    if time.nil?
      return Time.now.strftime('%m/%d/%Y')
    else
      Time.at(time).strftime('%m/%d/%Y')
    end
  end

  def date=(day)
    begin
      current_time = Time.now.to_datetime
      unless time.nil?
        current_time = Time.at(time).to_datetime
      end
      d = Date.strptime(day, '%m/%d/%Y')
      self.time = DateTime.new(d.year, d.month, d.day, current_time.hour,
                               current_time.min, current_time.sec,
                               current_time.zone).to_time.to_i
      @date_success = true
    rescue
      @date_success = false
    end
  end

  def day_time
    if time.nil?
      return Time.now.beginning_of_hour.strftime('%I:%M %p')
    else
      return Time.at(time).strftime('%I:%M %p')
    end
  end

  def day_time=(dt)
    begin
      current_time = Time.now.to_datetime
      unless time.nil?
        current_time = Time.at(time).to_datetime
      end
      t = DateTime.strptime(current_time.strftime('%Y %m %d ') + dt, '%Y %m %d %I:%M %p')
      self.time = DateTime.new(current_time.year, current_time.month,
                               current_time.day, t.hour, t.min, 0,
                               current_time.zone).to_time.to_i
      @time_success = true
    rescue
      @time_success = false
    end
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

  private
  def date_valid
    errors.add(:date, 'format not valid!') unless @date_success
  end

  def time_valid
    errors.add(:day_time, 'format not valid!') unless @time_success
  end
end
