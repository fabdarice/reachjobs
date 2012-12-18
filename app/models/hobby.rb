class Hobby < ActiveRecord::Base
  attr_accessible :name, :description, :visible, :position

  validates :name, :description, :presence => {:message => "Field cannot be empty."}

  default_scope order('created_at ASC')

  belongs_to :profile
end
