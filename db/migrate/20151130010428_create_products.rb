class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :image_url
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :category_id
      t.integer :manufacturer_id
      t.text :description

      t.timestamps null: false
    end
  end
end
