class AddProductTypeIdToAdminProducts < ActiveRecord::Migration
  def change
    add_column :admin_products, :product_typeId, :integer
  end
end
