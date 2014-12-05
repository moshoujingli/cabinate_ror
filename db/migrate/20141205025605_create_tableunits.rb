class CreateTableunits < ActiveRecord::Migration
  def change
    create_table :tableunits do |t|
      t.string :table_hash
      t.integer :status
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
