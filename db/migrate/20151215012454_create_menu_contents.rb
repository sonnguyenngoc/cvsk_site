class CreateMenuContents < ActiveRecord::Migration
  def change
    create_table :menu_contents do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
