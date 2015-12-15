class CreateProductOfEvents < ActiveRecord::Migration
  def change
    create_table :product_of_events do |t|
      t.integer :post_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
