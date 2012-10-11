class Skillcategory < ActiveRecord::Base
  attr_accessible :category_name, :position, :visible, :skills_attributes

  belongs_to :profile
  has_many :skills, :dependent => :destroy
  accepts_nested_attributes_for :skills, :allow_destroy => true, :reject_if => lambda { |a| a[:skill_name].blank? }
end
