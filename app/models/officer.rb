class Officer < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :name, :position, :password, :password_confirmation

  validates :password, :presence     => true,
                       :confirmation => true
  validates :name, :email, :position, :presence => true
end
