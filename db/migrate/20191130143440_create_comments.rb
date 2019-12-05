class CreateComments < ActiveRecord::Migration[5.2]
  def up
    create_table :comments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
  def down
  end
end
