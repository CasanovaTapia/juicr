class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.text :body
      t.references :user, index: true
      t.references :ask, index: true

      t.timestamps
    end
  end
end
