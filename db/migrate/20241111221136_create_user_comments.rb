class CreateUserComments < ActiveRecord::Migration[7.1]
  def change
    create_table :user_comments do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :publication, null: false, foreign_key: true

      t.timestamps
      add_column :user_comments, :likes_count, :integer, default: 0
      add_column :user_comments, :dislikes_count, :integer, default: 0
  
    end
  end
end
