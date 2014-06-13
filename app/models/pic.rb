class Pic < ActiveRecord::Base

  has_many :users
  has_many :favorite_pics
  has_many :favoritors, through: :favorite_pics, source: :user

  def self.latest_pics(num)
    Pic.find(:all, :order => "id", :limit => num).reverse
  end

  def favorited_by_user?(user)
    favoritors.include?(user)
  end


end
