class CreateShintyakus < ActiveRecord::Migration
  def change
    create_table :shintyakus do |t|
       t.string :shopname
       t.string :title
       t.date :date
       t.text :comment
       t.timestamps null: false
    end
  end
end
