class AddEmployerIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :employer_id, :integer
    
  end
end
