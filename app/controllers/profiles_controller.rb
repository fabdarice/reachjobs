class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
    @profile.socialnetwork = Socialnetwork.new
    2.times do 
      @category = @profile.skillcategories.build 
      @category.skills.build
    end
    
  end

  def create
    @profile = current_user.build_profile(params[:profile])


    if @profile.save
      flash[:notice] = "Sucess creating your Profile."
      render "edit"    
    else
      flash[:error] = "Error creating your profile."  
      render "new"
    end
  end   

  def edit
    @profile = current_user.profile
  end

  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def update
    if current_user.profile.update_attributes(params[:profile])
      flash[:notice] = "Sucess editing your Profile."
      redirect_to edit_user_profile_path(current_user)
    else
      flash[:error] = "Error editing your profile."  
      render "edit"
    end 
  end


end
