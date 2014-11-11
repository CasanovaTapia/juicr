class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.string :project_name
      t.text :project_description
      t.text :skills
      t.string :time_commitment
      t.string :location
      t.text :expectations
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
