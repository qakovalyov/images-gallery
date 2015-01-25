class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.belongs_to :gallery
      t.string :name
      t.string :hashtags
      t.timestamps
    end
  end
end
