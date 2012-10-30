class SchoolsController < ApplicationController
  def new
    @school = School.new
  end

  def create
    @school = current_user.profile.schools.build(params[:school])
    if (@school.save)
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "An error has occured."  
      render "new"
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(params[:school])
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "Error while saving the modifications."  
      render "edit"
    end 
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy
    respond_to do |format|
        format.html { }
        format.js { }
     end
  end
end
