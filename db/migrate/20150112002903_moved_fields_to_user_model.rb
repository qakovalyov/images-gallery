class MovedFieldsToUserModel < ActiveRecord::Migration
  def change
    remove_column :user_profiles, :first_name
    remove_column :user_profiles, :last_name
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
