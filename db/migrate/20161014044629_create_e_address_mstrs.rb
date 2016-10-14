class CreateEAddressMstrs < ActiveRecord::Migration
  def change
    create_table :e_address_mstrs do |t|
      t.integer :user_id,null: false
      t.string :email,null: false
      t.string :firstname,null: false
      t.string :middlename
      t.string :lastname,null: false
      t.string :address1,null: false
      t.string :address2
      t.string :pin,null: false
      t.string :country,null: false
      t.string :state,null: false
      t.string :phone,null: false
      t.string :status,null: false

      t.timestamps null: false
    end
  end
end
