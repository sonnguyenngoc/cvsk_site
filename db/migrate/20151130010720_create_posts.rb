class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :tag_id
      t.string :title
      t.text :content
      t.text :general_benefit

      t.timestamps null: false
    end
  end
end
