class ChangeDescriptionStringToText < ActiveRecord::Migration
  def change
    change_column :officers, :description, :text, :limit => nil,
                  :default => "", :null => false
  end
end
