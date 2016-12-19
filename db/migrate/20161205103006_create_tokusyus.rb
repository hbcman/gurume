class CreateTokusyus < ActiveRecord::Migration
  def change
    create_table :tokusyus do |t|
       t.string :title
       t.date :date
       t.text :comment
       t.text :url
      t.timestamps null: false
    end
  end
end