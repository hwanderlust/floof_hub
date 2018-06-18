class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :dwelling_type
      t.integer :household_members
      t.boolean :kids
      t.string :password_digest
      t.integer :location_id
      t.string :email_address
      t.string :street_address
      t.text :bio
      t.boolean :shelter_employee, default: false
      t.timestamps
    end
  end
end
