class AddLinkToSlideShows < ActiveRecord::Migration
  def change
    add_column :slide_shows, :link, :string
  end
end
