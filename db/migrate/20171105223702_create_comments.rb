class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :micropost, foreign_key: true

      t.timestamps
    end
    add_index :comments, [:micropost_id, :user_id, :created_at]
  end
end
