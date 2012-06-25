class Officer < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :name, :position, :password, :password_confirmation

  validates :password, :presence     => true,
                       :confirmation => true
  validates :name, :email, :position, :presence => true

  before_save :encrypt_password

  def password_correct?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def authenticate(email, submitted_password)
    officer = Officer.where({:email => email}).first
    return nil if user.nil?
    return officer if offier.password_correct? submitted_password
  end

  private

  def encrypt_password
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
