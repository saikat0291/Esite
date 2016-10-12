class AddUserIdToEProducttempDtls < ActiveRecord::Migration
  def change
    add_column :e_producttemp_dtls, :userId, :string, :null => false
  end
end
