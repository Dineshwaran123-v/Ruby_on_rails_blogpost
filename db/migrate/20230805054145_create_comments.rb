class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :blogpost, null: false, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:user_id, :post_id], unique: true
  end
end
