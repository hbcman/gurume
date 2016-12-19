class RemoveGooglemapFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :googlemap, :text
  end
end
