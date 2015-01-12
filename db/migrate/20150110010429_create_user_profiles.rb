class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :avatar
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
