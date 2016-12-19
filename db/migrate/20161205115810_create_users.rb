class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :genre
      t.string :address
      t.string :latitude
      t.string :longitude
      t.string :tel
      t.string :closingday
      t.string :time
      t.string :airphoto
      t.text :airtext
      t.string :menuphoto
      t.text :menutext
      t.string :itioshiphoto
      t.text :itioshitext
      t.text :coupon
      t.string :money
      t.string :storeurl
      t.text :comment
      t.text :feature

      t.timestamps null: false
    end
  end
end
