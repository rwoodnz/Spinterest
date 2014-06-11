require 'digest'

class User < ActiveRecord::Base
  # Remember to create a migration!

  def set_password(new_password)
    self.password_hash = PasswordHasher.hash_password(new_password)
  end

end
