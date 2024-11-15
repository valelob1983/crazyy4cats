class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :publication, null: false, foreign_key: true
      t.integer :like_type

      t.timestamps
    end
  end
end
