class CreateESubcategoryMstrs < ActiveRecord::Migration
  def change
    create_table :e_subcategory_mstrs do |t|
      t.integer :cat_id, :null => false
      t.string :subcategory_desc
      t.integer :is_active

      t.timestamps null: false
    end
  end
end
