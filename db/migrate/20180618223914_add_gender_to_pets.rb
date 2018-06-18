class AddGenderToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :gender, :string
    rename_column :pets, :type, :pet_type
  end

end
