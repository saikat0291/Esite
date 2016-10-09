class AddAvlCountToAdminProducts < ActiveRecord::Migration
  def change
    add_column :admin_products, :avl_count, :integer
  end
end
