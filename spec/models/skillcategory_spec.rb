require 'spec_helper'

describe Skillcategory do

  it { should belong_to(:profile) }
  it { should have_and_belong_to_many(:skills) }

  it "is valid with proper values" do
    skillcategory = FactoryGirl.build(:skillcategory)
    skillcategory.should be_valid
  end

  it "is invalid without a category name" do
    skillcategory = FactoryGirl.build(:skillcategory, :category_name => nil)
    skillcategory.should_not be_valid
    skillcategory.errors[:category_name].first.should eq("Field cannot be empty.") 
  end

  describe "#create_only_if_not_exist" do
    it "should add only if not existing skill name" do
      
      skillcategory = Skillcategory.new({:category_name => "Front-end"})
      skillcategory.should be_valid
      skillcategory.save.should == true

      skill = skillcategory.skills.build({:skill_name => "HTML"})
      skill.should be_valid
      skillcategory.save.should == true
      skillcategory.skills.size.should == 1

      new_skill = skillcategory.skills.build({:skill_name => "CSS"})
      new_skill.should be_valid
      skillcategory.save.should == true
      skillcategory.skills.size.should == 2

      existing_skill = skillcategory.skills.build({:skill_name => "CSS"})
      existing_skill.should be_valid
      skillcategory.save.should == true
      skillcategory.skills.size.should == 2

    end
  end
end
