class RenameCutmerToAddresses < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :custmer_id, :customer_id
  end
end
