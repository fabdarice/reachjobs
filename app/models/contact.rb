class Contact < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :email, :content
  validates :name, :content, :presence => { :message => "Field cannot be empty."}
end
