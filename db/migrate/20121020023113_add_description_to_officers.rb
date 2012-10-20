class AddDescriptionToOfficers < ActiveRecord::Migration
  def change
    add_column :officers, :description, :string, :default => "", :null => false
  end
end
