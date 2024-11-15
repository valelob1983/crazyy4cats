class AddUserCommentIdToReactions < ActiveRecord::Migration[7.1]
  def change
    add_column :reactions, :user_comment_id, :integer
  end
end
