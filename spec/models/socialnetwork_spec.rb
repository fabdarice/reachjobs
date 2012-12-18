require 'spec_helper'
 
describe Socialnetwork do
 
  it { should belong_to(:profile) }
 
  #Paperclip attachment testing
  it { should have_attached_file(:resume) }
  it { should validate_attachment_content_type(:resume).allowing('image/png', 'image/jpg', 'image/jpeg', 'application/pdf') }
  it { should validate_attachment_size(:resume).less_than(4.megabytes)}
 
  before(:each) do
    @socialnetwork = FactoryGirl.build(:socialnetwork)  
  end
         
 
  it "is valid with proper values" do
    @socialnetwork.should be_valid         
    @socialnetwork.save.should == true
  end
 
  it "is valid with empty values" do
    emptysocialnetwork = Socialnetwork.new    
	  emptysocialnetwork.should be_valid	
    emptysocialnetwork.save.should == true
  end


end
