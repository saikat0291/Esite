class CreateEOfferMstrs < ActiveRecord::Migration
  def change
    create_table :e_offer_mstrs do |t|
      t.integer :offer
      t.date :upto
      t.string :reason

      t.timestamps null: false
    end
  end
end
