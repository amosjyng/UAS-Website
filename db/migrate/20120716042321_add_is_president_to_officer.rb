class AddIsPresidentToOfficer < ActiveRecord::Migration
  def up
    change_table :officers do |table|
      table.boolean :is_president, :default => false
    end
    Officer.update_all ["is_president = ?", false]
  end
  
  def down
    remove_column :officers, :is_president
  end
end
