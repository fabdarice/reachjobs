require 'spec_helper'

describe Recommendation do

  before(:each) do
    @valid_attributes = {
      :content => "Recommendation Content for RSpec Unit Testing",
      :author => "UCLA Professor",
      :relation => "Future boss"
    }
  end

  it { should belong_to(:profile) }

  it "is invalid without a content" do
    recommendation = Recommendation.new(@valid_attributes.except(:content))
    recommendation.should_not be_valid
    recommendation.errors[:content].first.should eq("Field cannot be empty.") 
  end

  it "is invalid without an author" do
    recommendation = Recommendation.new(@valid_attributes.except(:author))
    recommendation.should_not be_valid
    recommendation.errors[:author].first.should eq("Field cannot be empty.") 
  end

  it "is valid without a relation" do
    recommendation = Recommendation.new(@valid_attributes.except(:relation))
    recommendation.should be_valid
  end

  it "should save when relation is empty" do
    Recommendation.new(@valid_attributes.except(:relation)).save.should == true
  end

end
