class AddColumnToBlogpost < ActiveRecord::Migration[7.0]
  def change
    add_column :blogposts, :category, :string
  end
end
