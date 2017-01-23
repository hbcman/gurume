class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :coupon1, :text
    add_column :users, :coupon2, :text
    add_column :users, :coupon3, :text
    add_column :users, :Presentation, :text
    add_column :users, :Presentation1, :text
    add_column :users, :Presentation2, :text
    add_column :users, :Presentation3, :text
    add_column :users, :use, :text
    add_column :users, :use1, :text
    add_column :users, :use2, :text
    add_column :users, :use3, :text
  end
end
