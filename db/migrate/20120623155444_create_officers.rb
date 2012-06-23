class CreateOfficers < ActiveRecord::Migration
  def change
    create_table :officers do |t|
      t.string :name
      t.string :position
      t.string :email

      t.timestamps
    end
  end
end
