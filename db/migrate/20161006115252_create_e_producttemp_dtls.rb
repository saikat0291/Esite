class CreateEProducttempDtls < ActiveRecord::Migration
  def change
    create_table :e_producttemp_dtls do |t|
      t.integer :product_id, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.string :user_name, null: false
      t.string :cart_id, null: false
      t.integer :offer_id
      t.timestamps null: false
    end
  end
end
