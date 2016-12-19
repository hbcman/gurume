class AddFeatureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :feature, :text
  end
end
