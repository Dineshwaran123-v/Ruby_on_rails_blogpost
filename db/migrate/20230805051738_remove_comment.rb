class RemoveComment < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogposts, :comment, :text
  end
end
