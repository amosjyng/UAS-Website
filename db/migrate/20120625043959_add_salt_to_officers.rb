class AddSaltToOfficers < ActiveRecord::Migration
  def change
    add_column :officers, :salt, :string
  end
end
