class AddColumnsToLogins < ActiveRecord::Migration
  def change
    add_column :logins, :provider, :string
    add_column :logins, :uid, :string
    add_column :logins, :username, :string, default: "anonymos"
  end
end
