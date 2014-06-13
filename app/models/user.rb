class User < ActiveRecord::Base
  has_many :pics
  has_many :favorite_pics
  has_many :favorites, through: :favorite_pics, source: :pic


  def set_password(new_password)
    self.password_salt = PasswordHasher.generate_salt
    self.password_hash = PasswordHasher.hash_password(new_password, password_salt)
    save!
  end

  def check_password(password)
    self.password_hash == PasswordHasher.hash_password(password, password_salt)
  end

  def toggle_favor(pic)
    if self.favorites.include?(pic)
      self.favorites.delete(pic)
    else
      self.favorites << pic
    end
    self.save
  end

end
