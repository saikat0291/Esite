class CreateAdminProducts < ActiveRecord::Migration
  def change
    create_table :admin_products do |t|
      t.integer :cat_id, null: false
      t.integer :subcat_id, null: false
      t.string :product_name
      t.integer :price
      t.string :product_image
      t.string :product_desc

      t.timestamps null: false
    end
  end
end
