class User < ActiveRecord::Base

  def set_password(new_password)
    self.password_salt = PasswordHasher.generate_salt
    self.password_hash = PasswordHasher.hash_password(new_password, password_salt)
    save!
  end

  def check_password(password)
    self.password_hash == PasswordHasher.hash_password(password, password_salt)
  end

end
