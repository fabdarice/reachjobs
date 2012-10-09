class Skill < ActiveRecord::Base
  attr_accessible :skill_name

  belongs_to :skillcategory
end
