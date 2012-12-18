require 'spec_helper'
 
describe School do
 
  it { should belong_to(:profile) }
 
  before(:each) do
    @school = FactoryGirl.build(:school)  
  end
         
 
  it "is valid with proper values" do
    @school.should be_valid         
    @school.save.should == true
  end
 
  it "is valid without an ending date" do
	  @school.end_date = nil
	  @school.should be_valid         
    @school.save.should == true
  end
 
  it "is valid without a degree specified" do
	  @school.degree = nil
	  @school.should be_valid         
    @school.save.should == true
  end
 
  it "is invalid without a name " do
	  @school.name = nil
    @school.should_not be_valid
    @school.errors[:name].first.should eq("Field cannot be empty.") 
  end

  it "is invalid without a city location " do
	  @school.city = nil
    @school.should_not be_valid
    @school.errors[:city].first.should eq("Field cannot be empty.") 
  end
  
  it "is invalid without a country location " do
	  @school.country = nil
    @school.should_not be_valid
    @school.errors[:country].first.should eq("Field cannot be empty.") 
  end
  
  it "is invalid without a field of study " do
	  @school.field_study = nil
    @school.should_not be_valid
    @school.errors[:field_study].first.should eq("Field cannot be empty.") 
  end
  
  it "is invalid without a starting date " do
	  @school.start_date = nil
    @school.should_not be_valid
    @school.errors[:start_date].first.should eq("Field cannot be empty.") 
  end

end
