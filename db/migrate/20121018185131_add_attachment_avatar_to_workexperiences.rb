class AddAttachmentAvatarToWorkexperiences < ActiveRecord::Migration
  def self.up
    change_table :workexperiences do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :workexperiences, :avatar
  end
end
