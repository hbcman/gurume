class AddContentsToLogins < ActiveRecord::Migration
  def change
    add_column :logins, :grade, :string
    add_column :logins, :faculty, :string
    add_column :logins, :course, :string
  end
end
