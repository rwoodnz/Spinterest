class Pic < ActiveRecord::Base

  def self.latest_pics(num)
    Pic.find(:all, :order => "id", :limit => num).reverse
  end

end
