class AddLongitudeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :longitude, :users
  end
end
