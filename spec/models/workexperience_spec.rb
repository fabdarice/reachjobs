require 'spec_helper'
 
describe Workexperience do
 
  it { should belong_to(:profile) }
  it { should have_and_belong_to_many(:skills) }
 
  #Paperclip attachment testing
  it { should have_attached_file(:avatar) }
  it { should validate_attachment_content_type(:avatar).allowing('image/png', 'image/jpg', 'image/jpeg') }
  it { should validate_attachment_size(:avatar).less_than(4.megabytes)}
 
  before(:each) do
    @workexperience = FactoryGirl.build(:workexperience)  
  end
         
 
  it "is valid with proper values" do
    @workexperience.should be_valid         
    @workexperience.save.should == true
  end
 
  it "is invalid without a company name" do
    @workexperience.company = nil
    @workexperience.should_not be_valid
    @workexperience.errors[:company].first.should eq("Field cannot be empty.") 
  end
         
 
  it "is invalid without a starting date" do
    @workexperience.start_date = nil
    @workexperience.should_not be_valid
    @workexperience.errors[:start_date].first.should eq("Field cannot be empty.") 
  end
 
  it "is invalid without a job title" do
    @workexperience.job_title = nil
    @workexperience.should_not be_valid
    @workexperience.errors[:job_title].first.should eq("Field cannot be empty.") 
  end
 
  it "is invalid without a city location" do
    @workexperience.city = nil
    @workexperience.should_not be_valid
    @workexperience.errors[:city].first.should eq("Field cannot be empty.") 
  end
 
  it "is invalid without a country location" do
    @workexperience.country = nil
    @workexperience.should_not be_valid
    @workexperience.errors[:country].first.should eq("Field cannot be empty.") 
  end
 
 
  describe "#create_only_if_not_exist" do
    it "should add only if not existing skill name" do                                    
      @workexperience.should be_valid
      @workexperience.save.should == true
 
      skill = @workexperience.skills.build({:skill_name => "Ruby on Rails"})
      skill.should be_valid
      @workexperience.save.should == true
      @workexperience.skills.size.should == 1
 
      new_skill = @workexperience.skills.build({:skill_name => "Cucumber"})
      new_skill.should be_valid
      @workexperience.save.should == true
      @workexperience.skills.size.should == 2
 
      existing_skill = @workexperience.skills.build({:skill_name => "Cucumber"})
      existing_skill.should be_valid
      @workexperience.save.should == true
      @workexperience.skills.size.should == 2
 
    end
  end
end
