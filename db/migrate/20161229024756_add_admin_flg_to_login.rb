class AddAdminFlgToLogin < ActiveRecord::Migration
  def change
    add_column :logins, :admin_flg, :boolean
  end
end
