class AddAttributeToBlogposts < ActiveRecord::Migration[7.0]
  def change
    add_column :blogposts, :comment, :text
  end
end
