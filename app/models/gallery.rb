class Gallery < ActiveRecord::Base
  attr_accessible :name, :headline, :description, :visible, :position, :avatar
  attr_accessible :skills_attributes

  validates :name, :headline, :avatar, :presence => { :message => "Field cannot be empty."}

  belongs_to :profile
  has_and_belongs_to_many :skills, :uniq => true
  has_many :pictures, :dependent => :destroy

  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: ->(a) { a[:skill_name].blank? }
  
  has_attached_file :avatar, :styles => {:small => "266x80#"}
  validates_attachment_content_type :avatar, :content_type => ['image/png', 'image/jpg', 'image/jpeg'], :message => "File type is not allowed (only .jpg or .png)."
  validates_attachment :avatar, :size => {:in => 0..4.megabytes, :message => "File must be less than 4MB."}
     
  before_save :create_only_if_not_exist
    
  protected
  def create_only_if_not_exist
     list_of_skills = []
     self.skills.each do |s|
         
       list_of_skills << Skill.find_or_create_by_skill_name(s.skill_name)
    end
    self.skills = list_of_skills
  end   
end
