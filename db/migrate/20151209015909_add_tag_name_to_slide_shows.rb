class AddTagNameToSlideShows < ActiveRecord::Migration
  def change
    add_column :slide_shows, :tag_name, :string
  end
end
