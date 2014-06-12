class CreatePic < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
