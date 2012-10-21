class Hobby < ActiveRecord::Base
  attr_accessible :name, :description, :visible, :position

  belongs_to :profile
end
