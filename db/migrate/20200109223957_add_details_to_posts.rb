class AddDetailsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :address, :string
    add_column :posts, :comment, :string
  end
end
