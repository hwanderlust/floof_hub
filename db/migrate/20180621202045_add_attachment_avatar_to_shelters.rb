class AddAttachmentAvatarToShelters < ActiveRecord::Migration[5.2]
  def self.up
    change_table :shelters do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :shelters, :avatar
  end
end
