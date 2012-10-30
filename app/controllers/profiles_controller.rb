class ProfilesController < ApplicationController
  respond_to :html, :xml, :json

  def show_edit
    if current_user.profile 
      @profile = current_user.profile
    else
      @profile = current_user.build_profile
      @profile.save
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
      flash[:success] = "All the modifications have been saved."
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "Error while saving the modifications."  
      render "edit"
    end 
  end


end
