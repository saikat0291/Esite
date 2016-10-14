class CreateBillTos < ActiveRecord::Migration
  def change
    create_table :bill_tos do |t|
      t.integer :user_id, null: false
      t.string :email, null: false, default: ""
      t.string :firstname, null: false, default: ""
      t.string :middlename
      t.string :lastname, null: false, default: ""
      t.string :address1, null: false, default: ""
      t.string :address2
      t.integer :pin, null: false
      t.string :country, null: false, default: ""
      t.string :state, null: false, default: ""
      t.integer :phone, null: false

      t.timestamps null: false
    end
  end
end
