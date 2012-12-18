require 'spec_helper'
 
describe Gallery do
 
  it { should belong_to(:profile) }
  it { should have_and_belong_to_many(:skills) }
  it { should have_many(:pictures) }
 
  #Paperclip attachment testing
  it { should have_attached_file(:avatar) }
  it { should validate_attachment_content_type(:avatar).allowing('image/png', 'image/jpg', 'image/jpeg') }
  it { should validate_attachment_size(:avatar).less_than(4.megabytes)}
 
  before(:each) do
    @gallery = FactoryGirl.build(:gallery)  
  end
         
 
  it "is valid with proper values" do
    @gallery.should be_valid         
    @gallery.save.should == true
  end
 
  it "is invalid without a name" do
    @gallery.name = nil
    @gallery.should_not be_valid
    @gallery.errors[:name].first.should eq("Field cannot be empty.") 
  end
         
 
  it "is invalid without a headline" do
    @gallery.headline = nil
    @gallery.should_not be_valid
    @gallery.errors[:headline].first.should eq("Field cannot be empty.") 
  end
 
  it "is invalid without a description" do
    @gallery.description = nil
    @gallery.should_not be_valid
    @gallery.errors[:description].first.should eq("Field cannot be empty.") 
  end
 
  it "is invalid without an avatar" do
    @gallery.avatar = nil
    @gallery.should_not be_valid
    @gallery.errors[:avatar].first.should eq("Gallery Avatar cannot be undefined.") 
  end
 
  describe "#create_only_if_not_exist" do
    it "should add a related skill only if not existing skill name" do                                    
      @gallery.should be_valid
      @gallery.save.should == true
 
      skill = @gallery.skills.build({:skill_name => "Ruby on Rails"})
      skill.should be_valid
      @gallery.save.should == true
      @gallery.skills.size.should == 1
 
      new_skill = @gallery.skills.build({:skill_name => "Cucumber"})
      new_skill.should be_valid
      @gallery.save.should == true
      @gallery.skills.size.should == 2
 
      existing_skill = @gallery.skills.build({:skill_name => "Cucumber"})
      existing_skill.should be_valid
      @gallery.save.should == true
      @gallery.skills.size.should == 2
 
    end
  end
end
