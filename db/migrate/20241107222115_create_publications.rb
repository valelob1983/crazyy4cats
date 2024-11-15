class CreatePublications < ActiveRecord::Migration[7.1]
  def change
    create_table :publications do |t|
      t.string :title, null: false, index: true
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps    
      add_column :comments, :likes_count, :integer, default: 0
      add_column :comments, :dislikes_count, :integer, default: 0

    end
  end
end
