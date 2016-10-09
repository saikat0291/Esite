class AddIsnewToAdminProducts < ActiveRecord::Migration
  def change
    add_column :admin_products, :isnew, :integer
  end
end
