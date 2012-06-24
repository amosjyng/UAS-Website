class ChangeDateToTime < ActiveRecord::Migration
  def up
  	change_table :events do |t|
      t.timestamp :time

        Event.all.each do |event|
          event.update_attribute(:time, event.date.to_time.to_i)
        end

      t.remove :date
  	end
  end

  def down
  end
end
