class ChangePostsLimit < ActiveRecord::Migration[5.1]
  def up
    change_column :posts, :title, :string, limit: 50, null: false
    change_column :posts, :description, :text, limit: 15000, null: false
  end
  def down
    change_column :posts, :title, :string
    change_column :posts, :description, :text
  end
end
