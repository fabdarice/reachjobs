require 'spec_helper'
 
describe Contact do
 
  before(:each) do
    @contact = FactoryGirl.build(:contact)  
  end
 
  it "is valid with proper values" do
    @contact.should be_valid         
    @contact.save.should == true
  end
  
  it "is valid without an anthor email" do
    @contact.email = nil
    @contact.should be_valid
    @contact.save.should == true
  end
 
  it "is invalid without a author name" do
    @contact.name = nil
    @contact.should_not be_valid
    @contact.errors[:name].first.should eq("Field cannot be empty.") 
  end
  
  it "is invalid without a content" do
    @contact.content = nil
    @contact.should_not be_valid
    @contact.errors[:content].first.should eq("Field cannot be empty.") 
  end
  
  
 
end
