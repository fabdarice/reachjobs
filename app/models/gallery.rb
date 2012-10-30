class Gallery < ActiveRecord::Base
  attr_accessible :name, :headline, :description, :visible, :position
  attr_accessible :skills_attributes
  belongs_to :profile
  has_and_belongs_to_many :skills, :uniq => true
  has_many :pictures

  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: ->(a) { a[:skill_name].blank? }
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: ->(a) { a[:avatar].blank? }
  
  has_attached_file :avatar, :styles => {:small => "250x200#"}
     
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
