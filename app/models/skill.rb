class Skill < ActiveRecord::Base
  attr_accessible :skill_name
  has_and_belongs_to_many :skillcategories, :uniq => true

end
