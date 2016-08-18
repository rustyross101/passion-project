require 'bcrypt' 

class User < ActiveRecord::Base
   include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(input_password)
    self.password == input_password
  end
  has_many :specifications
  
  validates :email, uniqueness: true, presence: true
  validates :password_hash, presence: true
end

