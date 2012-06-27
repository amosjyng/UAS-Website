class AddRememberTokenToOfficers < ActiveRecord::Migration
  def change
  	add_column :officers, :remember_token, :string
  	add_index  :officers, :remember_token
  end
end
