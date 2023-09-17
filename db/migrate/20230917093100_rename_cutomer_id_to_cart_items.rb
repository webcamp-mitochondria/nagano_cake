class RenameCutomerIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :cutomer_id, :customer_id
  end
end
