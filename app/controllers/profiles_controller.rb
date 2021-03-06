class ProfilesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!, :except => [:show]


  def show_edit
    if current_user.profile 
      @profile = current_user.profile
    else
      @profile = current_user.build_profile
      link = current_user.firstname + current_user.lastname
      link = link.downcase
      if Profile.exists?(:link => link)
        link = link + current_user.id.to_s
      end
      @profile.link = link
      @profile.save
    end
  end

  def edit
    @profile = current_user.profile
  end

  def show
    @profile = Profile.where("link = ? ", params[:link]).first
  end

  def update
    if current_user.profile.update_attributes(params[:profile])
      flash[:success] = "All the modifications have been saved."
      redirect_to show_edit_user_profile_path(current_user)
    else
      @profile = current_user.profile
      flash[:error] = "Error while saving the modifications."  
      render 'edit'
    end 
  end


end
