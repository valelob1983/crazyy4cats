class AddLikesAndDislikesCountToUserComments < ActiveRecord::Migration[7.1]
  def change
    add_column :user_comments, :likes_count, :integer
    add_column :user_comments, :dislikes_count, :integer
  end
end
