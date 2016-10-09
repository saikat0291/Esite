class AddOfferIdToAdminProducts < ActiveRecord::Migration
  def change
    add_column :admin_products, :offerId, :integer
  end
end
