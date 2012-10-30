class Project < ActiveRecord::Base
  attr_accessible :name, :headline, :description, :visible, :position, :avatar
  attr_accessible :skills_attributes

  validates :name, :headline, :description, :presence => { :message => "Field cannot be empty."}
  
  belongs_to :profile
  has_and_belongs_to_many :skills

  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: ->(a) { a[:skill_name].blank? }

  has_attached_file :avatar, :styles => {:small => "150x130#"}
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
