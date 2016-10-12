class CreateBillTos < ActiveRecord::Migration
  def change
    create_table :bill_tos do |t|
      t.integer :user_id
      t.string :email
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :address1
      t.string :address2
      t.integer :pin
      t.string :country
      t.string :state
      t.integer :phone

      t.timestamps null: false
    end
  end
end
