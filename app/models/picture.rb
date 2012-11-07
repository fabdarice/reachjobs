class Picture < ActiveRecord::Base
  attr_accessible :avatar

  default_scope order('created_at ASC')
  
  belongs_to :gallery

  has_attached_file :avatar, :styles => {:medium => "480x480#", :small => "100x100#"}
  validates_attachment_content_type :avatar, :content_type => ['image/png', 'image/jpg', 'image/jpeg'], :message => "File type is not allowed (only .jpg or .png)."
  validates_attachment :avatar, :size => {:in => 0..4.megabytes, :message => "File must be less than 4MB."}
end
