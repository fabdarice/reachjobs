class AddAttachmentResumeToSocialnetworks < ActiveRecord::Migration
  def self.up
    change_table :socialnetworks do |t|
      t.has_attached_file :resume
    end
  end

  def self.down
    drop_attached_file :socialnetworks, :resume
  end
end
