class Picture < ActiveRecord::Base
  attr_accessible :avatar
  belongs_to :gallery

  has_attached_file :avatar, :styles => {:small => "250x200#"}
end
