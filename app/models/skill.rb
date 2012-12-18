class Skill < ActiveRecord::Base

  default_scope order('created_at ASC')

  attr_accessible :skill_name
  has_and_belongs_to_many :skillcategories, :uniq => true
  has_and_belongs_to_many :workexperiences, :uniq => true, :join_table => "workexperiences_skills"
  has_and_belongs_to_many :projects, :uniq => true
  has_and_belongs_to_many :galleries, :uniq => true

end
