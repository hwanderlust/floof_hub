class RemoveTransactionFeeFromShelters < ActiveRecord::Migration[5.2]
  def change
    remove_column :shelters, :transaction_fee, :float
    remove_column :shelters, :street_address, :string
  end
end
