class Socialnetwork < ActiveRecord::Base
  attr_accessible :twitter_link, :facebook_link, :linkedin_link, :viadeo_link, :reachjobs_link

  belongs_to :profile
end
