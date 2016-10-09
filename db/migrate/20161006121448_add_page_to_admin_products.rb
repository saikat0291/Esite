class AddPageToAdminProducts < ActiveRecord::Migration
  def change
    add_column :admin_products, :page, :integer
  end
end
