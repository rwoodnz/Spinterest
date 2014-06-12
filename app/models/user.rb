class User < ActiveRecord::Base

  def set_password(new_password)
    self.password_hash = PasswordHasher.hash_password(new_password)
  end

  def check_password(password)
    self.password_hash == PasswordHasher.hash_password(password)
  end

end
