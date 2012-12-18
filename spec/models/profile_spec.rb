require 'spec_helper'

describe Profile do

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


  it "is valid with proper values" do
    @profile = FactoryGirl.build(:profile)
    @profile.should be_valid
    @profile.save.should == true
  end

  it "is valid even with only link value filled in" do
    @user = FactoryGirl.build(:user)
    @user.should be_valid
    @user.save.should == true

    @profile = @user.build_profile
    @profile.link = "http://reachjobs.net/fabricecheng"
    @profile.should be_valid
    @profile.save.should == true
  end

  it "is invalid with a duplicate link (case insensitive)" do
    @user = FactoryGirl.build(:user)
    @profile = @user.build_profile
    @profile.link = "http://reachjobs.net/fabricecheng"
    @profile.should be_valid
    @profile.save == true

    @user2 = FactoryGirl.build(:user)
    @duplicate_profile = @user2.build_profile
    @duplicate_profile.link = "http://reachjobs.net/fabricecheng"
    @duplicate_profile.should_not be_valid

    @duplicate_profile.link.upcase!
    @duplicate_profile.should_not be_valid    
  end

  it "is invalid without a link" do
    @profile = FactoryGirl.build(:profile)
    @profile.link = nil   
    @profile.should_not be_valid 
    @profile.errors[:link].first.should eq("Field cannot be empty.") 
  end

  it "is invalid with a link smaller than 4 characters" do
    @profile = FactoryGirl.build(:profile)
    @profile.link = "123"   
    @profile.should_not be_valid 
    @profile.errors[:link].first.should eq("4 characters minimum.") 
  end

end
