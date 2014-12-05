class ChangeColumnInProducts < ActiveRecord::Migration
  def change
    remove_column :products, :type
    add_column :products, :category, :integer
  end
end
