class AddCategoryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :category_id, :integer
    add_index :users, :category_id
  end
end
