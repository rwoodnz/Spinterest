class CreateFavoritePic < ActiveRecord::Migration
  def change
    create_table :favorite_pics do |t|
      t.belongs_to :user
      t.belongs_to :pic
    end
  end
end
