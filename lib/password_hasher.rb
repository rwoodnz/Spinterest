require 'bcrypt'

module PasswordHasher
  def self.hash_password(password, salt)
    ::BCrypt::Engine.hash_secret(password, salt)
  end

  def self.generate_salt
    ::BCrypt::Engine.generate_salt
  end
end
