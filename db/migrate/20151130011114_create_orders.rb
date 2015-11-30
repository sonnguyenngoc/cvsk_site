class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :type_id
      t.string :customer_name
      t.string :customer_email
      t.string :customer_phone
      t.integer :many_people
      t.datetime :order_date
      t.text :message

      t.timestamps null: false
    end
  end
end
