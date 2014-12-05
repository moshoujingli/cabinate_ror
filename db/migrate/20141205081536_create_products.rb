class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.float :price
      t.integer :type
      t.integer :status
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
