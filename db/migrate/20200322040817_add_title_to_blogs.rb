class AddTitleToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :title, :text
  end
end
