class CreateSlideShows < ActiveRecord::Migration
  def change
    create_table :slide_shows do |t|
      t.string :image_url
      t.string :title_1
      t.string :title_2
      t.text :description

      t.timestamps null: false
    end
  end
end
