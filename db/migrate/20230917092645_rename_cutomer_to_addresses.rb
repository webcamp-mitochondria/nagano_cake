class RenameCutomerToAddresses < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :customer, :custmer_id
  end
end
