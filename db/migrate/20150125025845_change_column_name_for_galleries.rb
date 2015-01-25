class ChangeColumnNameForGalleries < ActiveRecord::Migration
  def change
    rename_column :galleries, :user_id, :owner_id
  end
end
