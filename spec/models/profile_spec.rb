require 'spec_helper'

describe Profile do

=begin
  before(:each) do
    @valid_attributes = {
      :email => "fabrice.cheng@gmail.com",
      :password => "UCLADMIN",
      :password_confirmation => "UCLADMIN",
      :remember_me => true,
      :lastname => "Cheng",
      :firstname => "Fabrice"
    }   
  end
=end

  #Relational Database testing
  it { should have_one(:socialnetwork) }
  it { should belong_to(:user) }
  it { should have_many(:recommendations) }
  it { should have_many(:skillcategories) }
  it { should have_many(:workexperiences) }
  it { should have_many(:projects) }
  it { should have_many(:schools) }
  it { should have_many(:languages) }
  it { should have_many(:hobbies) }
  it { should have_many(:galleries) }

  #Paperclip attachment testing
  it { should have_attached_file(:photo) }
  it { should validate_attachment_content_type(:photo).allowing('image/png', 'image/jpg', 'image/jpeg') }
  it { should validate_attachment_size(:photo).less_than(4.megabytes)}

  it { should ensure_length_of(:link).is_at_least(4).with_message(/4 characters minimum./) }

  it "is invalid with a duplicate link (case insensitive)" do
    profile = Profile.new({:link => 'http://reachjobs.net/fabricecheng'})
    profile.save == true

    duplicate_profile = Profile.new({:link => 'http://reachjobs.net/fabricecheng'})
    duplicate_profile.should_not be_valid

    duplicate_profile.link.upcase!
  end

end
