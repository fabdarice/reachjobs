class ProfilesController < ApplicationController
  respond_to :html, :xml, :json

  def new
    @profile = Profile.new
    @profile.socialnetwork = Socialnetwork.new
    @skills = Skill.pluck(:skill_name)
    @skills.map {|skill| skill}.join(',')
  end

  def create
    @profile = current_user.build_profile(params[:profile])
    if @profile.save
      flash[:success] = "Your profile has been successfully created."
      render "edit"    
    else
      flash[:error] = "Error while creating your profile."  
      render "new"
    end
  end   

  def edit
    @profile = current_user.profile
    @skills = Skill.pluck(:skill_name)
    @skills.map {|skill| skill}.join(',')
  end

  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def update
    if current_user.profile.update_attributes(params[:profile])
      flash[:success] = "All the modifications have been saved."
      redirect_to edit_user_profile_path(current_user)
    else
      flash[:error] = "Error while saving the modifications."  
      render "edit"
    end 
  end


end
