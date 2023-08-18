class DeleteColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogposts, :category, :string
  end
end
