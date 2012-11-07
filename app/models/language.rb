class Language < ActiveRecord::Base
  attr_accessible :name, :level, :visible, :position, :additional_information

  default_scope order('created_at ASC')

  belongs_to :profile
end
