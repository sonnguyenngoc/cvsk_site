class AddRunCheckToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :run_check, :string
  end
end
