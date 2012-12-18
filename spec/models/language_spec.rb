require 'spec_helper'
 
describe Language do
 
  it { should belong_to(:profile) }
 
  before(:each) do
    @language = FactoryGirl.build(:language)  
  end
         
 
  it "is valid with proper values" do
    @language.should be_valid         
    @language.save.should == true
  end
  
  it "is valid without additional information" do
    @language.additional_information = nil 
    @language.should be_valid         
    @language.save.should == true
  end
 
  it "is invalid without a name" do
    @language.name = nil   
	  @language.should_not be_valid	
	  @language.errors[:name].first.should eq("Field cannot be empty.") 
  end

  it "is invalid without a level" do
    @language.level = nil   
	  @language.should_not be_valid	
	  @language.errors[:level].first.should eq("Field cannot be empty.") 
  end
  
  

end
