class Socialnetwork < ActiveRecord::Base
  attr_accessible :twitter_link, :facebook_link, :linkedin_link, :viadeo_link, :reachjobs_link, :skype_link, :resume

  belongs_to :profile
  has_attached_file :resume, :styles => {:small => {:geometry => "122x150!", :format => :png} }
  validates_attachment_content_type :resume, :content_type => ['image/png', 'image/jpg', 'image/jpeg', 'application/pdf'], :message => "File type is not allowed (only jpg/png/pdf)."
  validates_attachment :resume, :size => {:in => 0..4.megabytes, :message => "File must be less than 4MB."}
end
