class WorkexperiencesController < ApplicationController
  def new
    @workexperience = Workexperience.new
    @skills = Skill.pluck(:skill_name)
    @skills.map {|skill| skill}.join(',') 
  end

  def create
    @workexperience = current_user.profile.workexperiences.build(params[:workexperience])
    if (@workexperience.save)
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "An error has occured."  
      render "new"
    end
  end

  def edit
    @workexperience = Workexperience.find(params[:id])
    @skills = Skill.pluck(:skill_name)
    @skills.map {|skill| skill}.join(',') 
  end

  def update
    @workexperience = Workexperience.find(params[:id])
    if @workexperience.update_attributes(params[:workexperience])
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "Error while saving the modifications."  
      render "edit"
    end 
  end

  def destroy
    @workexperience = Workexperience.find(params[:id])
    @workexperience.destroy
    respond_to do |format|
        format.html { }
        format.js { }
     end
  end
end
