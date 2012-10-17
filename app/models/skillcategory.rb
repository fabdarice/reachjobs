class Skillcategory < ActiveRecord::Base
  attr_accessible :category_name, :position, :visible, :skills_attributes
  belongs_to :profile
  has_and_belongs_to_many :skills, :uniq => true
  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: ->(a) { a[:skill_name].blank? }
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
