class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :image_url
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.text :intro

      t.timestamps null: false
    end
  end
end
