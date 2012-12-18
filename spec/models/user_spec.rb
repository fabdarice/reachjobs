require 'spec_helper'

describe User do

  before(:each) do
    @user = FactoryGirl.build(:user)  
  end

  it { should have_one(:profile) }

  # is invalid with a password less than 6 characters 
  it { should ensure_length_of(:password).is_at_least(6).with_message(/6 characters minimum./) }

  it "is invalid without an email" do
    @user.email = nil
    @user.should_not be_valid
    @user.errors[:email].first.should eq("Field cannot be empty.") 
  end

  it "is invalid with an invalid email" do
    @user.email = "fabricechenggmail.com"
    @user.should_not be_valid
  end

  it "is invalid without a lastname" do
    @user.lastname = nil
    @user.should_not be_valid
    @user.errors[:lastname].first.should eq("Field cannot be empty.") 
  end

  it "is invalid without a firstname" do
    @user.firstname = nil
    @user.should_not be_valid
    @user.errors[:firstname].first.should eq("Field cannot be empty.") 
  end  

  it "is invalid without a password" do
    @user.password = nil
    @user.should_not be_valid
    @user.errors[:password].first.should eq("Field cannot be empty.") 
  end

  it "is invalid without a password confirmation" do
    @user.password_confirmation = nil
    @user.should_not be_valid
    @user.errors[:password_confirmation].first.should eq("Field cannot be empty.") 
  end

  it "is invalid with a password less than 6 characters" do
    @user.password = "12345"   
    @user.should_not be_valid 
    @user.errors[:password].first.should eq("6 characters minimum.") 
  end

  it "is invalid with an existing registered email" do
    @user.should be_valid
    @user.save == true
    
    duplicate_user = FactoryGirl.build(:user, :lastname => 'Messi', :firstname => 'Lionel', :password => 'MESSIGOAL', :password_confirmation => 'MESSIGOAL')
    duplicate_user.should_not be_valid
  end
  
  it "is invalid with a password different than the password_confirmation" do
    @user.should be_valid

    @user.password_confirmation = 'DIFFUCLADMIN'
    @user.should_not be_valid
  end

end
