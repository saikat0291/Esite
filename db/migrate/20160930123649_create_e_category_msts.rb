class CreateECategoryMsts < ActiveRecord::Migration
  def change
    create_table :e_category_msts do |t|
      t.integer :category_id, :null => false
      t.string :category_desc
      t.integer :is_active

      t.timestamps null: false
    end
  end
end
