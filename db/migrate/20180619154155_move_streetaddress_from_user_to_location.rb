class MoveStreetaddressFromUserToLocation < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :street_address, :string
    add_column :locations, :street_address, :string 
  end
end
