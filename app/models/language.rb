class Language < ActiveRecord::Base
  attr_accessible :name, :level, :visible, :position, :additional_information

  belongs_to :profile
end
