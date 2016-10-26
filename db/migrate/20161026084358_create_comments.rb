class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string   :body
      t.integer  :post_id
      t.integer  :author_id
      t.datetime :published_at

      t.timestamps
    end
    add_index :comments, :author_id
    add_index :comments, :post_id
    add_index :comments, [:author_id, :post_id]
    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts
  end
end
