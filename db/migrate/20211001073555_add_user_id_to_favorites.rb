class AddUserIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :user_id, :intager
  end
end
