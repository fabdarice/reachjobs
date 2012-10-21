class School < ActiveRecord::Base
  attr_accessible :start_date, :end_date, :name, :city, :country, :degree, :field_study, :visible, :position

  belongs_to :profile
end
