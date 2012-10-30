class AddAttachmentAvatarToGalleries < ActiveRecord::Migration
  def self.up
    change_table :galleries do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :galleries, :avatar
  end
end
