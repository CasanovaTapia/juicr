class CreateGives < ActiveRecord::Migration
  def change
    create_table :gives do |t|
      t.text :body
      t.references :user, index: true
      t.references :ask, index: true
    
      t.timestamps
    end
  end
end
