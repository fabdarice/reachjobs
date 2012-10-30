class ProjectsController < ApplicationController
  def new
    @project = Project.new
    @skills = Skill.pluck(:skill_name)
    @skills.map {|skill| skill}.join(',') 
  end

  def create
    @project = current_user.profile.projects.build(params[:project])
    if (@project.save)
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "An error has occured."  
      render "new"
    end
  end

  def edit
    @project = Project.find(params[:id])
    @skills = Skill.pluck(:skill_name)
    @skills.map {|skill| skill}.join(',') 
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "Error while saving the modifications."  
      render "edit"
    end 
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
        format.html { }
        format.js { }
     end
  end
end
