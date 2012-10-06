class Recommendation < ActiveRecord::Base
  attr_accessible :content, :author, :relation

  belongs_to :profile
end
