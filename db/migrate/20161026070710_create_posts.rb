class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string   :title
      t.string   :body
      t.integer  :author_id
      t.datetime :published_at

      t.timestamps
    end
    add_index :posts, :title
    add_index :posts, :author_id
    add_foreign_key :posts, :users, column: :author_id
  end
end
