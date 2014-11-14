class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :status, :string
    add_column :users, :location, :string
    add_column :users, :category, :string
    add_column :users, :skill, :text
    add_column :users, :achievement, :text
    add_column :users, :portfolio, :string
  end
end
