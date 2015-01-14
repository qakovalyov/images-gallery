class AddRelationUserWithProfile < ActiveRecord::Migration
  def change
    add_reference :users, :profile, index: true
    add_reference :user_profiles, :user, index: true
  end
end
