class Recommendation < ActiveRecord::Base
  attr_accessible :content, :author, :relation

  default_scope order('created_at ASC')

  validates :content, :author, :presence => { :message => "Field cannot be empty." }
  belongs_to :profile
end
