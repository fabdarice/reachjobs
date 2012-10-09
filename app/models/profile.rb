class Profile < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :head_description, :second_description, :about_me_description, :search_description, :photo, :phone, :socialnetwork_attributes, :recommendations_attributes, :skillcategories_attributes
  belongs_to :user
  has_one :socialnetwork
  has_many :recommendations
  has_many :skillcategories

  has_attached_file :photo, :styles => {:small => "130x150#"}

  accepts_nested_attributes_for :recommendations, :allow_destroy => true, :reject_if => lambda { |a| a[:content].blank? || a[:author].blank? }
  accepts_nested_attributes_for :socialnetwork, :allow_destroy => true
  accepts_nested_attributes_for :skillcategories, :allow_destroy => true, :reject_if => lambda { |a| a[:category_name].blank? }

end
