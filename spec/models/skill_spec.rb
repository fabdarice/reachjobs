require 'spec_helper'
 
describe Skill do
 
  before(:each) do
    @skill = FactoryGirl.build(:skill)  
  end
 
  it { should have_and_belong_to_many(:skillcategories) }
  it { should have_and_belong_to_many(:workexperiences) }
  it { should have_and_belong_to_many(:projects) }
  it { should have_and_belong_to_many(:galleries) }
 
  it "is valid with proper values" do
    @skill.should be_valid         
    @skill.save.should == true
  end
   
end
