class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.text  :text
      t.text  :image
      t.string  :name
      t.timestamps
    end
  end
end