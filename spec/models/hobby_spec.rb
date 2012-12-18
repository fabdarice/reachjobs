require 'spec_helper'
 
describe Hobby do
 
  it { should belong_to(:profile) }
 
  before(:each) do
    @hobby = FactoryGirl.build(:hobby)  
  end
         
  it "is valid with proper values" do
    @hobby.should be_valid         
    @hobby.save.should == true
  end
 
  it "is invalid without a name" do
    @hobby.name = nil
    @hobby.should_not be_valid
    @hobby.errors[:name].first.should eq("Field cannot be empty.") 
  end

  it "is invalid without a description" do
    @hobby.description = nil
    @hobby.should_not be_valid
    @hobby.errors[:description].first.should eq("Field cannot be empty.") 
  end

end
