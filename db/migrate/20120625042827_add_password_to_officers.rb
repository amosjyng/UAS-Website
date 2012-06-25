class AddPasswordToOfficers < ActiveRecord::Migration
  def change
    add_column :officers, :encrypted_password, :string
  end
end
