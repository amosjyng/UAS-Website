class AddAvatorToOfficers < ActiveRecord::Migration
  def up
    add_attachment :officers, :avatar
  end
  
  def down
    remove_attachment :officers, :avatar
  end
end
