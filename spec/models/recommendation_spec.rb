require 'spec_helper'

describe Recommendation do

  it { should belong_to(:profile) }

  it "is valid with proper values" do
    recommendation = FactoryGirl.build(:recommendation)
    recommendation.should be_valid
  end

  it "is invalid without a content" do
    recommendation = FactoryGirl.build(:recommendation, :content => nil)
    recommendation.should_not be_valid
    recommendation.errors[:content].first.should eq("Field cannot be empty.") 
  end

  it "is invalid without an author" do
    recommendation = FactoryGirl.build(:recommendation, :author => nil)
    recommendation.should_not be_valid
    recommendation.errors[:author].first.should eq("Field cannot be empty.") 
  end

  it "is valid without a relation" do
    recommendation = FactoryGirl.build(:recommendation, :relation => nil)
    recommendation.should be_valid
  end

end
