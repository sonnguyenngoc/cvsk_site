class AddOrderTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_time, :string
  end
end
