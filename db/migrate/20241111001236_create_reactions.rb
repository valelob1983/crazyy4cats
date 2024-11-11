class CreateReactions < ActiveRecord::Migration[7.1]
  def change
    create_table :reactions do |t|
      t.string :kind
      t.references :publications, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer "publication_id"
      t.integer "user_id"
      t.timestamps
    end
  end
end
