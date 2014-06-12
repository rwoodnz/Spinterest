require 'digest'

module PasswordHasher
  def self.hash_password(password)
    sha256 = Digest::SHA256.new
    sha256.digest password
  end
end
