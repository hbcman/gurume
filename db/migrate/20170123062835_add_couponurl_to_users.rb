class AddCouponurlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :couponurl, :text
  end
end
