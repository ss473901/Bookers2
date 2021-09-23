class RemoveProgileFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :progile, :text
  end
end
