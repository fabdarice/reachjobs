class Profile < ActiveRecord::Base
  
  attr_accessible :head_description, :second_description, :about_me_description, :search_description, :photo, :phone, :link
  
  belongs_to :user

  validates :link, :presence => { :message => "Field cannot be empty." }
  validates :link, :uniqueness => { :case_sensitive => false, :message => "This link has already been taken." }
  validates :link, :length => {:minimum => 4, :too_short => "4 characters minimum."}

  has_one :socialnetwork
  has_many :recommendations
  has_many :skillcategories
  has_many :workexperiences
  has_many :projects
  has_many :schools
  has_many :languages
  has_many :hobbies
  has_many :galleries

  has_attached_file :photo, :styles => {:small => "130x130#"}
  validates_attachment_content_type :photo, :content_type => ['image/png', 'image/jpg', 'image/jpeg'], :message => "File type is not allowed (only .jpg or .png)."
  validates_attachment :photo, :size => {:in => 0..4.megabytes, :message => "File must be less than 4MB."}

end
