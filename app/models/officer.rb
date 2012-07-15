class Officer < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :name, :position, :password, :password_confirmation, :remember_token

  validates :name, :email, :position, :presence => true

  before_save :encrypt_password

  def password_correct?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def authenticate(submitted_password)
    return self if password_correct? submitted_password
  end

  def create_remember_token
    self.remember_token = SecureRandom.hex
  end
  
  def change_password(new_password)
    self.password = new_password
    save
  end

  private

  def encrypt_password
    self.password ||= SecureRandom.hex if encrypted_password.nil?
    self.salt = make_salt unless password_correct?(password)
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}<->#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}<->{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
