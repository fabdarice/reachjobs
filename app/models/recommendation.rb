class Recommendation < ActiveRecord::Base
  attr_accessible :content, :author, :relation

  validates :content, :author, :presence => { :message => "Field cannot be empty." }
  belongs_to :profile
end
