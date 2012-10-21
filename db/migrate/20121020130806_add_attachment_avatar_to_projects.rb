class AddAttachmentAvatarToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :projects, :avatar
  end
end
