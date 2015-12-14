class CreateManufacturerImages < ActiveRecord::Migration
  def change
    create_table :manufacturer_images do |t|
      t.integer :manufacturer_id
      t.string :listing_image_url

      t.timestamps null: false
    end
  end
end
