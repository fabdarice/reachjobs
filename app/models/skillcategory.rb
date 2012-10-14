class Skillcategory < ActiveRecord::Base
  attr_accessible :category_name, :position, :visible, :skills_attributes

  belongs_to :profile
  has_and_belongs_to_many :skills
  accepts_nested_attributes_for :skills, :reject_if => lambda { |a| a[:skill_name].blank? }
end
