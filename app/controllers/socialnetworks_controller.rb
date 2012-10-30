class SocialnetworksController < ApplicationController
  def edit
    @profile = current_user.profile
    if @profile.socialnetwork
      @socialnetwork = @profile.socialnetwork
    else
      @socialnetwork = @profile.build_socialnetwork
      @socialnetwork.save
    end
  end

  def update
    if current_user.profile.socialnetwork.update_attributes(params[:socialnetwork])
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "Error while saving the modifications."  
      render "edit"
    end 
  end
end
