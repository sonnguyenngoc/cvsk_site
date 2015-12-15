class CreateListingMenuProducts < ActiveRecord::Migration
  def change
    create_table :listing_menu_products do |t|
      t.integer :menu_content_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
