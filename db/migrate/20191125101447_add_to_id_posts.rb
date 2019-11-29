class AddToIdPosts < ActiveRecord::Migration[5.1]
  def up
    execute 'DELETE FROM posts;'
    add_reference :posts, :user, null: false, index: true
  end

  def down
    remove_reference :posts, :user, index: true
  end
end
