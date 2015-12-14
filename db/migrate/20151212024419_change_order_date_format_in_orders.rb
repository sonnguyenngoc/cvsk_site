class ChangeOrderDateFormatInOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :order_date
    add_column :orders, :order_date, :datetime
  end
  def down
    remove_column :orders, :order_date
    add_column :orders, :order_date, :string
  end
end
