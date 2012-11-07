class School < ActiveRecord::Base
  attr_accessible :start_date, :end_date, :name, :city, :country, :degree, :field_study, :visible, :position

  default_scope order('start_date DESC')

  validates :name, :city, :country, :field_study, :start_date, :presence => { :message => "Field cannot be empty."}

  belongs_to :profile
end
