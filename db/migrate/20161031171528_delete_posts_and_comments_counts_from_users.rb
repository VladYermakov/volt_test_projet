class DeletePostsAndCommentsCountsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :posts_count
    remove_column :users, :comments_count
  end
end
