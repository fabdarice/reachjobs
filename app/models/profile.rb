class Profile < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :head_description, :second_description, :about_me_description, :search_description, :photo, :phone
  #attr_accessible :socialnetwork_attributes, :recommendations_attributes, :skillcategories_attributes, :workexperiences_attributes, :projects_attributes, :schools_attributes, :languages_attributes, :hobbies_attributes, :galleries_attributes
  belongs_to :user

  has_one :socialnetwork
  has_many :recommendations
  has_many :skillcategories, :order => "position"
  has_many :workexperiences, :order => "position"
  has_many :projects, :order => "position"
  has_many :schools, :order => "position"
  has_many :languages, :order => "position"
  has_many :hobbies, :order => "position"
  has_many :galleries, :order => "position"

  has_attached_file :photo, :styles => {:small => "130x130#"}

end
