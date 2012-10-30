class HobbiesController < ApplicationController
  def new
    @hobby = Hobby.new
  end

  def create
    @hobby = current_user.profile.hobbies.build(params[:hobby])
    if (@hobby.save)
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "An error has occured."  
      render "new"
    end
  end

  def edit
    @hobby = Hobby.find(params[:id])
  end

  def update
    @hobby = Hobby.find(params[:id])
    if @hobby.update_attributes(params[:hobby])
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "Error while saving the modifications."  
      render "edit"
    end 
  end

  def destroy
    @hobby = Hobby.find(params[:id])
    @hobby.destroy
    respond_to do |format|
        format.html { }
        format.js { }
     end
  end
end
