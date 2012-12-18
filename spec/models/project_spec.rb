require 'spec_helper'
 
describe Project do
 
  it { should belong_to(:profile) }
  it { should have_and_belong_to_many(:skills) }
 
  #Paperclip attachment testing
  it { should have_attached_file(:avatar) }
  it { should validate_attachment_content_type(:avatar).allowing('image/png', 'image/jpg', 'image/jpeg') }
  it { should validate_attachment_size(:avatar).less_than(4.megabytes)}
 
  before(:each) do
    @project = FactoryGirl.build(:project)  
  end
         
  it "is valid with proper values" do
    @project.should be_valid         
    @project.save.should == true
  end
 
  it "is invalid without a name" do
    @project.name = nil
    @project.should_not be_valid
    @project.errors[:name].first.should eq("Field cannot be empty.") 
  end
         
 
  it "is invalid without a headline" do
    @project.headline = nil
    @project.should_not be_valid
    @project.errors[:headline].first.should eq("Field cannot be empty.") 
  end
 
  it "is invalid without a description" do
    @project.description = nil
    @project.should_not be_valid
    @project.errors[:description].first.should eq("Field cannot be empty.") 
  end

 
  describe "#create_only_if_not_exist" do
    it "should add only if not existing skill name" do                                    
      @project.should be_valid
      @project.save.should == true
 
      skill = @project.skills.build({:skill_name => "Ruby on Rails"})
      skill.should be_valid
      @project.save.should == true
      @project.skills.size.should == 1
 
      new_skill = @project.skills.build({:skill_name => "Cucumber"})
      new_skill.should be_valid
      @project.save.should == true
      @project.skills.size.should == 2
 
      existing_skill = @project.skills.build({:skill_name => "Cucumber"})
      existing_skill.should be_valid
      @project.save.should == true
      @project.skills.size.should == 2
    end
  end
end
