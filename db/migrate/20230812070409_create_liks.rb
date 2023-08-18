class CreateLiks < ActiveRecord::Migration[7.0]
  def change
    create_table :liks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :blogpost, null: false, foreign_key: true

      t.timestamps
    end

    add_index :liks, [:user_id, :blogpost_id], unique: true
  end
end
