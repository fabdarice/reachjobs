class Profile < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :head_description, :second_description, :about_me_description, :search_description, :photo, :phone, :link
  #attr_accessible :socialnetwork_attributes, :recommendations_attributes, :skillcategories_attributes, :workexperiences_attributes, :projects_attributes, :schools_attributes, :languages_attributes, :hobbies_attributes, :galleries_attributes
  belongs_to :user

  validates :link, :uniqueness => { :case_sensitive => false, :message => "This link has already been taken." }
  validates :link, :length => {:minimum => 4, :too_short => "4 characters minimum."}

  has_one :socialnetwork
  has_many :recommendations
  has_many :skillcategories, :order => "position"
  has_many :workexperiences, :order => "position"
  has_many :projects, :order => "position"
  has_many :schools, :order => "position"
  has_many :languages, :order => "position"
  has_many :hobbies, :order => "position"
  has_many :galleries, :order => "position"

  has_attached_file :photo, :styles => {:small => "130x130#"}
  validates_attachment_content_type :photo, :content_type => ['image/png', 'image/jpg', 'image/jpeg'], :message => "File type is not allowed (only .jpg or .png)."
  validates_attachment :photo, :size => {:in => 0..4.megabytes, :message => "File must be less than 4MB."}

end
