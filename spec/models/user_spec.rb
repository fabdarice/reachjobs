require 'spec_helper'

describe User do

  before(:each) do
    @valid_attributes = {
      :email => "fabrice.cheng@gmail.com",
      :password => "UCLADMIN",
      :password_confirmation => "UCLADMIN",
      :remember_me => true,
      :lastname => "Cheng",
      :firstname => "Fabrice"
    }   
  end

  it { should have_one(:profile) }

  # is invalid with a password less than 6 characters 
  it { should ensure_length_of(:password).is_at_least(6).with_message(/6 characters minimum./) }

  it "is invalid without an email" do
    user = User.new(@valid_attributes.except(:email))
    user.should_not be_valid
    user.errors[:email].first.should eq("Field cannot be empty.") 
  end

  it "is invalid without a lastname" do
    user = User.new(@valid_attributes.except(:lastname))
    user.should_not be_valid
    user.errors[:lastname].first.should eq("Field cannot be empty.") 
  end

  it "is invalid without a firstname" do
    user = User.new(@valid_attributes.except(:firstname))
    user.should_not be_valid
    user.errors[:firstname].first.should eq("Field cannot be empty.") 
  end  

  it "is invalid without an email" do
    user = User.new(@valid_attributes.except(:email))
    user.should_not be_valid
    user.errors[:email].first.should eq("Field cannot be empty.") 
  end

  it "is invalid without a password" do
    user = User.new(@valid_attributes.except(:password))
    user.should_not be_valid
    user.errors[:password].first.should eq("Field cannot be empty.") 
  end

  it "is invalid without a password confirmation" do
    user = User.new(@valid_attributes.except(:password_confirmation))
    user.should_not be_valid
    user.errors[:password_confirmation].first.should eq("Field cannot be empty.") 
  end

  it "is invalid with an existing registered email" do
    user = User.new(@valid_attributes)
    user.save.should == true

    user2 = User.new({:email => 'fabrice.cheng@gmail.com', :lastname => 'Messi', :firstname => 'Lionel', :password => 'MESSIGOAL', :password_confirmation => 'MESSIGOAL'})
    user2.should_not be_valid
  end
  
  it "is invalid with a password different than the password_confirmation" do
    user = User.new(@valid_attributes)
    user.should be_valid

    user.password_confirmation = 'DIFFUCLADMIN'
    user.should_not be_valid
  end

end
