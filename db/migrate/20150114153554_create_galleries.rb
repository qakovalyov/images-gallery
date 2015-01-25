class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.belongs_to :user
    end
    add_reference :users, :gallery, index: true
  end
end
