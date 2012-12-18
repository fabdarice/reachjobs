class Language < ActiveRecord::Base
  attr_accessible :name, :level, :visible, :position, :additional_information

  validates :name, :level, :presence => {:message => "Field cannot be empty."}

  default_scope order('created_at ASC')

  belongs_to :profile
end
