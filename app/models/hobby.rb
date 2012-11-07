class Hobby < ActiveRecord::Base
  attr_accessible :name, :description, :visible, :position

  default_scope order('created_at ASC')

  belongs_to :profile
end
