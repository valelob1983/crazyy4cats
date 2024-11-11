class ChangeUserIdToBeNullableInUserComments < ActiveRecord::Migration[7.1]
  def change
    change_column_null :user_comments, :user_id, true
  end
end
