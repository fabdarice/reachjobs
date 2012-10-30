class Socialnetwork < ActiveRecord::Base
  attr_accessible :twitter_link, :facebook_link, :linkedin_link, :viadeo_link, :reachjobs_link, :skype_link, :resume

  belongs_to :profile
  has_attached_file :resume, :styles => {:small => {:geometry => "122x150#", :format => :png} }

end
